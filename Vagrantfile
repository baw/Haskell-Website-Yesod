Vagrant::Config.run do |config|
    config.vm.box = 'lazygray/heroku-cedar-14'

    config.vm"virtualbox" do |v|
        v.customize[
            "modifyvm", :id,
            "--name", "Test_Environment",
            "--memory", "2048"
        ]
    end
end
