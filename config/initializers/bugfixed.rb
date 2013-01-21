#fixed lasted bug found with rails
ActionDispatch::ParamsParser::DEFAULT_PARSERS.delete(Mime::XML)