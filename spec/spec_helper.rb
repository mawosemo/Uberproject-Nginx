require 'chefspec'
require 'chefspec/policyfile'


at_exit { ChefSpec::Coverage.report! } #provides a more detailed coverage report
