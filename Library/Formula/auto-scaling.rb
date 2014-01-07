require 'formula'

class AutoScaling < AmazonWebServicesFormula
  homepage 'http://aws.amazon.com/developertools/2535'
  url 'http://ec2-downloads.s3.amazonaws.com/AutoScaling-2011-01-01.zip'
  version  '1.0.61.4'
  sha1 'a01b92d88f70a17ad2ecf6d254d31053eba3cf57'

  def install
    standard_install
  end

  def caveats
    standard_instructions "AWS_AUTO_SCALING_HOME"
  end
end
