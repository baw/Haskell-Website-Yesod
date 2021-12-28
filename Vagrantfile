Vagrant.configure("2") do |config|
    config.vm.box = 'ubuntu/focal64'
    config.vm.network "forwarded_port", guest: 3000, host: 3000
    config.vm.provider "virtualbox" do |v|
        v.name = "Test_Environment"
        v.memory = 4096
    end

    config.vm.provision "shell", inline: <<-SHELL
        sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
        wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

        sudo apt-get update

        sudo apt install -y libpq-dev postgresql-13 postgresql-client-13
        echo Create postgres user
        sudo -u postgres psql -c "CREATE USER vagrant WITH PASSWORD 'password';"
        sudo -u postgres createdb -O vagrant website
        echo Set /vargrant directory to load on ssh
        echo "cd /vagrant" >> /home/vagrant/.bashrc
        echo "PATH=$PATH:/root/.local/bin" >> /home/vagrant/.bashrc
        
        echo Installing stack
        curl -sSL https://get.haskellstack.org/ | sh
    SHELL

    config.vm.provision "shell", run: "always", inline: <<-SHELL
        echo Adding enviromental variables
        > /etc/profile.d/env_vars.sh
        echo "export PGUSER=vagrant; export PGPASS=password" >> /etc/profile.d/env_vars.sh
    SHELL
end
