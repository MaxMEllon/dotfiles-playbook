require 'spec_helper'

describe package('zsh') do
  it 'expect to installed zsh and version is 5.0.8' do
    zsh_command, _, _ = Open3.capture3('which zsh')
    out, err, _ = Open3.capture3("#{zsh_command.chomp} --version")
    expect(out.chomp).to match /5.0.8/
  end
end

describe command('ls ~/.zshrc.zwc') do
  its(:exit_status) { should eq 0}
end

describe command('ls ~/.zshenv') do
  its(:exit_status) { should eq 0}
end

