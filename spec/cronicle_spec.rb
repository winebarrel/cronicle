describe Cronicle do
  context 'when empty cron' do
    let(:jobfile) do
      <<-RUBY.undent
        on servers: /.*/ do
          job :foo, user: :root do
            puts `uname`
          end
        end

        on servers: /.*/ do
          job :bar, user: :root, content: <<-SH.undent
            #!/bin/sh
            echo hello
          SH
        end
      RUBY
    end

    it do
      cronicle(:exec, :foo) { jobfile }
      cronicle(:exec, :bar) { jobfile }
    end
  end

  context 'when default cron' do
    before do
      on TARGET_HOSTS do |ssh_options|
        user = ssh_options[:user]

        set_crontab user, <<-CRON.undent
          FOO=bar
          ZOO=baz
          1 1 1 1 1 echo #{user} > /dev/null
        CRON

        set_crontab :root, <<-CRON.undent
          FOO=bar
          ZOO=baz
          1 1 1 1 1 echo root > /dev/null
        CRON
      end
    end

    it do
      on :amazon_linux do
        expect(get_uname).to match /amzn/
        puts get_crontabs
      end
    end

    it do
      on :ubuntu do
        expect(get_uname).to match /Ubuntu/
        puts get_crontabs
      end
    end
  end
end