class LacTemperature < ActiveRecord::Base
  belongs_to :lac
  attr_accessible :temperature, :when_happen

  after_save :check_fish_grow

  before_validation :is_last_when_happen?
  validates :temperature, :numericality => true, :presence => true
  validates :when_happen, :presence => true, :uniqueness => { :scope => :lac_id}

  # La GRANDE DECOUVERTE
  # Entre avril et juillet (pendant la reproduction),
  #   Dès que la temperature est supérieur a 20 degré, le volume de poisson augmente de 3*log10(longitude) % par jour
  #
  # Entre juillet et octobre,
  #   Si la temperature est entre 25 et 35, le pecheur sort plus, donc cette fois c'est une baisse de 2*log10(longitude) %
  #
  # Entre novembre et decembre
  #   Le poisson a froid et est pas encore pret pour les grands froid, donc si la température descent en dessous de -15, donc chute de log10(longitude) %

  def check_fish_grow
    lac_fish_by_date = self.lac.lac_fish_by_dates.new(:date => self.when_happen, :fish_volume => self.lac.lac_fish_by_dates.last ? self.lac.lac_fish_by_dates.last.fish_volume : self.lac.initial_volume)
    #entre avril et juillet inclus
    if self.when_happen >= Time.gm(Time.now.year, 4).to_date and self.when_happen < Time.gm(Time.now.year, 8).to_date
      lac_fish_by_date.fish_volume += lac_fish_by_date.fish_volume * (3*Math.log10(self.lac.longitude)/100) if self.temperature >= 20
    end

    #entre juillet et octobre inclus
    if self.when_happen >= Time.gm(Time.now.year, 7).to_date and self.when_happen < Time.gm(Time.now.year, 11).to_date
      lac_fish_by_date.fish_volume -= lac_fish_by_date.fish_volume * (2*Math.log10(self.lac.longitude)/100) if self.temperature >= 25 and self.temperature <=35
    end

    #entre novembre et decembre inclus
    if self.when_happen >= Time.gm(Time.now.year, 11).to_date and self.when_happen < Time.gm(Time.now.year, 12).to_date
      lac_fish_by_date.fish_volume -= lac_fish_by_date.fish_volume * (Math.log10(self.lac.longitude)/100) if self.temperature <=-15
    end
    lac_fish_by_date.save
  end


  def is_last_when_happen?
    if LacTemperature.where(:lac_id => self.lac_id).order('when_happen ASC').last and
        LacTemperature.where(:lac_id => self.lac_id).order('when_happen ASC').last.when_happen > self.when_happen
      self.errors[:when_happen] << I18n.t('lac_temperatures.date_in_past_errors')
    end
  end
end