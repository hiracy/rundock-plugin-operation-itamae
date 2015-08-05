require 'spec_helper'

describe file('/tmp/test_file_from_itamae') do
  it { should be_file }
  its(:content) { should match(/test_file from itamae/) }
end
