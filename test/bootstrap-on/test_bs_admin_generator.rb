require 'helper'

describe "BsAdminGenerator" do

  def setup
    @apptmp = "#{Dir.tmpdir}/padrino-tests/#{UUID.new.generate}"
    `mkdir -p #{@apptmp}`
  end

  def teardown
    `rm -rf #{@apptmp}`
  end

  describe 'the admin app generator' do

    it 'should fail outside app root' do
      out, err = capture_io { generate(:bs_admin, "-r=#{@apptmp}") }
      assert_match(/not at the root/, out)
      assert_no_file_exists('/tmp/admin')
    end

    it "should fail if we don't specify an orm" do
      capture_io { generate(:project, 'sample_project', "--root=#{@apptmp}", '-e=haml') }
      assert_raises(SystemExit) { @out, @err = capture_io { generate(:bs_admin, "-r=#{@apptmp}/sample_project") } }
    end

    it 'should correctly generate a new padrino admin application with default renderer' do
      capture_io { generate(:project, 'sample_project', "--root=#{@apptmp}", '-d=activerecord', '-e=haml') }
      capture_io { generate(:bs_admin, "--root=#{@apptmp}/sample_project") }
      assert_file_exists("#{@apptmp}/sample_project")
      assert_file_exists("#{@apptmp}/sample_project/admin")
      assert_file_exists("#{@apptmp}/sample_project/admin/app.rb")
      assert_file_exists("#{@apptmp}/sample_project/admin/controllers")
      assert_file_exists("#{@apptmp}/sample_project/admin/controllers/accounts.rb")
      assert_file_exists("#{@apptmp}/sample_project/admin/controllers/base.rb")
      assert_file_exists("#{@apptmp}/sample_project/admin/controllers/sessions.rb")
      assert_file_exists("#{@apptmp}/sample_project/admin/views")
      assert_file_exists("#{@apptmp}/sample_project/admin/views/accounts/_form.haml")
      assert_file_exists("#{@apptmp}/sample_project/admin/views/accounts/edit.haml")
      assert_file_exists("#{@apptmp}/sample_project/admin/views/accounts/index.haml")
      assert_file_exists("#{@apptmp}/sample_project/admin/views/accounts/new.haml")
      assert_file_exists("#{@apptmp}/sample_project/admin/views/base/index.haml")
      assert_file_exists("#{@apptmp}/sample_project/admin/views/sessions/new.haml")
      assert_file_exists("#{@apptmp}/sample_project/admin/views/base/index.haml")
      assert_file_exists("#{@apptmp}/sample_project/admin/views/layouts/application.haml")
      assert_file_exists("#{@apptmp}/sample_project/admin/views/sessions/new.haml")
      assert_file_exists("#{@apptmp}/sample_project/public/admin")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/css")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/css/bootstrap.css")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/css/bootstrap.min.css")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/css/bootstrap-responsive.css")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/css/bootstrap-responsive.min.css")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/ico")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/ico/apple-touch-icon-114-precomposed.png")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/ico/apple-touch-icon-144-precomposed.png")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/ico/apple-touch-icon-57-precomposed.png")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/ico/apple-touch-icon-72-precomposed.png")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/ico/favicon.ico")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/img")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/img/glyphicons-halflings-white.png")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/img/glyphicons-halflings.png")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/js")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/js/bootstrap.js")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/js/bootstrap.min.js")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/js/jquery-min.js")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/js/jquery-ujs.js")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/js/jquery.js")
      assert_file_exists("#{@apptmp}/sample_project/models/account.rb")
      assert_file_exists("#{@apptmp}/sample_project/db/seeds.rb")
      assert_file_exists("#{@apptmp}/sample_project/db/migrate/001_create_accounts.rb")
      assert_match_in_file 'Padrino.mount("Admin").to("/admin")', "#{@apptmp}/sample_project/config/apps.rb"
      assert_match_in_file 'class Admin < Padrino::Application', "#{@apptmp}/sample_project/admin/app.rb"
      assert_match_in_file 'role.project_module :accounts, \'/accounts\'', "#{@apptmp}/sample_project/admin/app.rb"
      assert_match_in_file 'button_to pat(:logout)', "#{@apptmp}/sample_project/admin/views/layouts/application.haml"
    end

    it 'should correctly generate a new padrino admin application with erb renderer' do
      capture_io { generate(:project, 'sample_project', "--root=#{@apptmp}", '-d=activerecord', '-e=erb') }
      capture_io { generate(:bs_admin, "--root=#{@apptmp}/sample_project") }
      assert_file_exists("#{@apptmp}/sample_project")
      assert_file_exists("#{@apptmp}/sample_project/admin")
      assert_file_exists("#{@apptmp}/sample_project/admin/app.rb")
      assert_file_exists("#{@apptmp}/sample_project/admin/controllers")
      assert_file_exists("#{@apptmp}/sample_project/admin/controllers/accounts.rb")
      assert_file_exists("#{@apptmp}/sample_project/admin/controllers/base.rb")
      assert_file_exists("#{@apptmp}/sample_project/admin/controllers/sessions.rb")
      assert_file_exists("#{@apptmp}/sample_project/admin/views")
      assert_file_exists("#{@apptmp}/sample_project/admin/views/accounts/_form.erb")
      assert_file_exists("#{@apptmp}/sample_project/admin/views/accounts/edit.erb")
      assert_file_exists("#{@apptmp}/sample_project/admin/views/accounts/index.erb")
      assert_file_exists("#{@apptmp}/sample_project/admin/views/accounts/new.erb")
      assert_file_exists("#{@apptmp}/sample_project/admin/views/base/index.erb")
      assert_file_exists("#{@apptmp}/sample_project/admin/views/sessions/new.erb")
      assert_file_exists("#{@apptmp}/sample_project/admin/views/base/index.erb")
      assert_file_exists("#{@apptmp}/sample_project/admin/views/layouts/application.erb")
      assert_file_exists("#{@apptmp}/sample_project/admin/views/sessions/new.erb")
      assert_file_exists("#{@apptmp}/sample_project/public/admin")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/css")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/css/bootstrap.css")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/css/bootstrap.min.css")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/css/bootstrap-responsive.css")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/css/bootstrap-responsive.min.css")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/ico")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/ico/apple-touch-icon-114-precomposed.png")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/ico/apple-touch-icon-144-precomposed.png")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/ico/apple-touch-icon-57-precomposed.png")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/ico/apple-touch-icon-72-precomposed.png")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/ico/favicon.ico")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/img")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/img/glyphicons-halflings-white.png")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/img/glyphicons-halflings.png")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/js")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/js/bootstrap.js")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/js/bootstrap.min.js")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/js/jquery-min.js")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/js/jquery-ujs.js")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/js/jquery.js")
      assert_file_exists("#{@apptmp}/sample_project/models/account.rb")
      assert_file_exists("#{@apptmp}/sample_project/db/seeds.rb")
      assert_file_exists("#{@apptmp}/sample_project/db/migrate/001_create_accounts.rb")
      assert_match_in_file 'Padrino.mount("Admin").to("/admin")', "#{@apptmp}/sample_project/config/apps.rb"
      assert_match_in_file 'class Admin < Padrino::Application', "#{@apptmp}/sample_project/admin/app.rb"
      assert_match_in_file 'role.project_module :accounts, \'/accounts\'', "#{@apptmp}/sample_project/admin/app.rb"
      assert_match_in_file 'link_to(\'Sign Out\', url(:sessions, :destroy)', "#{@apptmp}/sample_project/admin/views/layouts/application.erb"
    end

    it 'should correctly generate a new padrino admin application with slim renderer' do
      capture_io { generate(:project, 'sample_project', "--root=#{@apptmp}", '-d=activerecord', '-e=slim') }
      capture_io { generate(:bs_admin, "--root=#{@apptmp}/sample_project") }
      assert_file_exists("#{@apptmp}/sample_project")
      assert_file_exists("#{@apptmp}/sample_project/admin")
      assert_file_exists("#{@apptmp}/sample_project/admin/app.rb")
      assert_file_exists("#{@apptmp}/sample_project/admin/controllers")
      assert_file_exists("#{@apptmp}/sample_project/admin/controllers/accounts.rb")
      assert_file_exists("#{@apptmp}/sample_project/admin/controllers/base.rb")
      assert_file_exists("#{@apptmp}/sample_project/admin/controllers/sessions.rb")
      assert_file_exists("#{@apptmp}/sample_project/admin/views")
      assert_file_exists("#{@apptmp}/sample_project/admin/views/accounts/_form.slim")
      assert_file_exists("#{@apptmp}/sample_project/admin/views/accounts/edit.slim")
      assert_file_exists("#{@apptmp}/sample_project/admin/views/accounts/index.slim")
      assert_file_exists("#{@apptmp}/sample_project/admin/views/accounts/new.slim")
      assert_file_exists("#{@apptmp}/sample_project/admin/views/base/index.slim")
      assert_file_exists("#{@apptmp}/sample_project/admin/views/sessions/new.slim")
      assert_file_exists("#{@apptmp}/sample_project/admin/views/base/index.slim")
      assert_file_exists("#{@apptmp}/sample_project/admin/views/layouts/application.slim")
      assert_file_exists("#{@apptmp}/sample_project/admin/views/sessions/new.slim")
      assert_file_exists("#{@apptmp}/sample_project/public/admin")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/css")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/css/bootstrap.css")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/css/bootstrap.min.css")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/css/bootstrap-responsive.css")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/css/bootstrap-responsive.min.css")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/ico")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/ico/apple-touch-icon-114-precomposed.png")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/ico/apple-touch-icon-144-precomposed.png")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/ico/apple-touch-icon-57-precomposed.png")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/ico/apple-touch-icon-72-precomposed.png")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/ico/favicon.ico")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/img")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/img/glyphicons-halflings-white.png")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/img/glyphicons-halflings.png")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/js")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/js/bootstrap.js")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/js/bootstrap.min.js")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/js/jquery-min.js")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/js/jquery-ujs.js")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/js/jquery.js")
      assert_file_exists("#{@apptmp}/sample_project/models/account.rb")
      assert_file_exists("#{@apptmp}/sample_project/db/seeds.rb")
      assert_file_exists("#{@apptmp}/sample_project/db/migrate/001_create_accounts.rb")
      assert_match_in_file 'Padrino.mount("Admin").to("/admin")', "#{@apptmp}/sample_project/config/apps.rb"
      assert_match_in_file 'class Admin < Padrino::Application', "#{@apptmp}/sample_project/admin/app.rb"
      assert_match_in_file 'role.project_module :accounts, \'/accounts\'', "#{@apptmp}/sample_project/admin/app.rb"
      assert_match_in_file 'button_to pat(:logout)', "#{@apptmp}/sample_project/admin/views/layouts/application.slim"
    end

    it 'should correctly generate a new padrino admin application with a custom model' do
      capture_io { generate(:project, 'sample_project', "--root=#{@apptmp}", '-d=activerecord', '-e=slim') }
      capture_io { generate(:bs_admin, "--root=#{@apptmp}/sample_project", '-m=User') }
      assert_file_exists("#{@apptmp}/sample_project")
      assert_file_exists("#{@apptmp}/sample_project/admin")
      assert_file_exists("#{@apptmp}/sample_project/admin/app.rb")
      assert_file_exists("#{@apptmp}/sample_project/admin/controllers")
      assert_file_exists("#{@apptmp}/sample_project/admin/controllers/users.rb")
      assert_no_match_in_file(/[^_]account/i, "#{@apptmp}/sample_project/admin/controllers/users.rb")
      assert_file_exists("#{@apptmp}/sample_project/admin/controllers/base.rb")
      assert_file_exists("#{@apptmp}/sample_project/admin/controllers/sessions.rb")
      assert_file_exists("#{@apptmp}/sample_project/admin/views")
      assert_file_exists("#{@apptmp}/sample_project/admin/views/users/_form.slim")
      assert_no_match_in_file(/[^_]account/i, "#{@apptmp}/sample_project/admin/views/users/_form.slim")
      assert_file_exists("#{@apptmp}/sample_project/admin/views/users/edit.slim")
      assert_no_match_in_file(/[^_]account/i, "#{@apptmp}/sample_project/admin/views/users/edit.slim")
      assert_file_exists("#{@apptmp}/sample_project/admin/views/users/index.slim")
      assert_no_match_in_file(/[^_]account/i, "#{@apptmp}/sample_project/admin/views/users/index.slim")
      assert_file_exists("#{@apptmp}/sample_project/admin/views/users/new.slim")
      assert_no_match_in_file(/[^_]account/i, "#{@apptmp}/sample_project/admin/views/users/new.slim")
      assert_file_exists("#{@apptmp}/sample_project/admin/views/base/index.slim")
      assert_file_exists("#{@apptmp}/sample_project/admin/views/sessions/new.slim")
      assert_file_exists("#{@apptmp}/sample_project/admin/views/base/index.slim")
      assert_file_exists("#{@apptmp}/sample_project/admin/views/layouts/application.slim")
      assert_file_exists("#{@apptmp}/sample_project/admin/views/sessions/new.slim")
      assert_file_exists("#{@apptmp}/sample_project/public/admin")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/css")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/css/bootstrap.css")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/css/bootstrap.min.css")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/css/bootstrap-responsive.css")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/css/bootstrap-responsive.min.css")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/ico")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/ico/apple-touch-icon-114-precomposed.png")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/ico/apple-touch-icon-144-precomposed.png")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/ico/apple-touch-icon-57-precomposed.png")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/ico/apple-touch-icon-72-precomposed.png")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/ico/favicon.ico")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/img")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/img/glyphicons-halflings-white.png")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/img/glyphicons-halflings.png")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/js")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/js/bootstrap.js")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/js/bootstrap.min.js")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/js/jquery-min.js")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/js/jquery-ujs.js")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/js/jquery.js")
      assert_file_exists("#{@apptmp}/sample_project/models/user.rb")
      assert_no_match_in_file(/Account/, "#{@apptmp}/sample_project/models/user.rb")
      assert_file_exists("#{@apptmp}/sample_project/db/seeds.rb")
      assert_file_exists("#{@apptmp}/sample_project/db/migrate/001_create_users.rb")
      assert_no_match_in_file(/[^_]account/i, "#{@apptmp}/sample_project/db/migrate/001_create_users.rb")
      assert_match_in_file 'Padrino.mount("Admin").to("/admin")', "#{@apptmp}/sample_project/config/apps.rb"
      assert_match_in_file 'class Admin < Padrino::Application', "#{@apptmp}/sample_project/admin/app.rb"
      assert_match_in_file 'role.project_module :users, \'/users\'', "#{@apptmp}/sample_project/admin/app.rb"
      assert_match_in_file 'button_to pat(:logout)', "#{@apptmp}/sample_project/admin/views/layouts/application.slim"
    end

    it 'should correctly generate a new padrino admin application with model in non-default application path' do
      capture_io { generate(:project, 'sample_project', "--root=#{@apptmp}", '-d=activerecord', '-e=haml') }
      capture_io { generate(:bs_admin,"-a=/admin", "--root=#{@apptmp}/sample_project") }
      assert_file_exists("#{@apptmp}/sample_project")
      assert_file_exists("#{@apptmp}/sample_project/admin")
      assert_file_exists("#{@apptmp}/sample_project/admin/app.rb")
      assert_file_exists("#{@apptmp}/sample_project/admin/controllers")
      assert_file_exists("#{@apptmp}/sample_project/admin/controllers/accounts.rb")
      assert_file_exists("#{@apptmp}/sample_project/admin/controllers/base.rb")
      assert_file_exists("#{@apptmp}/sample_project/admin/controllers/sessions.rb")
      assert_file_exists("#{@apptmp}/sample_project/admin/views")
      assert_file_exists("#{@apptmp}/sample_project/admin/views/accounts/_form.haml")
      assert_file_exists("#{@apptmp}/sample_project/admin/views/accounts/edit.haml")
      assert_file_exists("#{@apptmp}/sample_project/admin/views/accounts/index.haml")
      assert_file_exists("#{@apptmp}/sample_project/admin/views/accounts/new.haml")
      assert_file_exists("#{@apptmp}/sample_project/admin/views/base/index.haml")
      assert_file_exists("#{@apptmp}/sample_project/admin/views/sessions/new.haml")
      assert_file_exists("#{@apptmp}/sample_project/admin/views/base/index.haml")
      assert_file_exists("#{@apptmp}/sample_project/admin/views/layouts/application.haml")
      assert_file_exists("#{@apptmp}/sample_project/admin/views/sessions/new.haml")
      assert_file_exists("#{@apptmp}/sample_project/public/admin")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/css")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/css/bootstrap.css")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/css/bootstrap.min.css")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/css/bootstrap-responsive.css")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/css/bootstrap-responsive.min.css")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/ico")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/ico/apple-touch-icon-114-precomposed.png")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/ico/apple-touch-icon-144-precomposed.png")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/ico/apple-touch-icon-57-precomposed.png")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/ico/apple-touch-icon-72-precomposed.png")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/ico/favicon.ico")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/img")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/img/glyphicons-halflings-white.png")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/img/glyphicons-halflings.png")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/js")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/js/bootstrap.js")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/js/bootstrap.min.js")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/js/jquery-min.js")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/js/jquery-ujs.js")
      assert_file_exists("#{@apptmp}/sample_project/public/admin/js/jquery.js")
      assert_file_exists("#{@apptmp}/sample_project/admin/models/account.rb")
      assert_no_file_exists("#{@apptmp}/sample_project/models/account.rb")
      assert_file_exists("#{@apptmp}/sample_project/db/seeds.rb")
      assert_file_exists("#{@apptmp}/sample_project/db/migrate/001_create_accounts.rb")
      assert_match_in_file 'Padrino.mount("Admin").to("/admin")', "#{@apptmp}/sample_project/config/apps.rb"
      assert_match_in_file 'class Admin < Padrino::Application', "#{@apptmp}/sample_project/admin/app.rb"
      assert_match_in_file 'role.project_module :accounts, \'/accounts\'', "#{@apptmp}/sample_project/admin/app.rb"
      assert_match_in_file 'button_to pat(:logout)', "#{@apptmp}/sample_project/admin/views/layouts/application.haml"
    end

    it 'should not add activerecord middleware for #datamapper' do
      capture_io { generate(:project, 'sample_project', "--root=#{@apptmp}", '-d=datamapper', '-e=haml') }
      capture_io { generate(:bs_admin,"-a=/admin", "--root=#{@apptmp}/sample_project") }
      assert_no_match_in_file(/  use ActiveRecord::ConnectionAdapters::ConnectionManagemen/m, "#{@apptmp}/sample_project/admin/app.rb")
    end

    it 'should add activerecord middleware for #activerecord' do
      capture_io { generate(:project, 'sample_project', "--root=#{@apptmp}", '-d=activerecord', '-e=haml') }
      capture_io { generate(:bs_admin,"-a=/admin", "--root=#{@apptmp}/sample_project") }
      assert_match_in_file(/  use ActiveRecord::ConnectionAdapters::ConnectionManagemen/m, "#{@apptmp}/sample_project/admin/app.rb")
    end

    it 'should add activerecord middleware for #mini_record' do
      capture_io { generate(:project, 'sample_project', "--root=#{@apptmp}", '-d=mini_record', '-e=haml') }
      capture_io { generate(:bs_admin,"-a=/admin", "--root=#{@apptmp}/sample_project") }
      assert_match_in_file(/  use ActiveRecord::ConnectionAdapters::ConnectionManagemen/m, "#{@apptmp}/sample_project/admin/app.rb")
    end

    it 'should not conflict with existing seeds file' do
      capture_io { generate(:project, 'sample_project', "--root=#{@apptmp}", '-d=activerecord', '-e=erb') }

      # Add seeds file
      FileUtils.mkdir_p @apptmp + '/sample_project/db' unless File.exist?(@apptmp + '/sample_project/db')
      File.open(@apptmp + '/sample_project/db/seeds.rb', 'w+') do |seeds_rb|
        seeds_rb.puts "# Old Seeds Content"
      end

      capture_io do
        # TODO: this doesn't work, so figure out why
        # $stdout.expects(:print).with { |value| value =~ /Overwrite\s.*?\/db\/seeds.rb/ }.never
        # $stdin.stubs(:gets).returns('y')
        generate(:bs_admin, "--root=#{@apptmp}/sample_project")
      end

      assert_file_exists "#{@apptmp}/sample_project/db/seeds.old"
      assert_match_in_file 'Account.create(', "#{@apptmp}/sample_project/db/seeds.rb"
    end

    it "should navigate completely inside an app with activerecord" do
      capture_io { generate(:project, 'sample_project', "--root=#{@apptmp}", "-d=activerecord", "-e=haml", "--dev") }
      capture_io { generate(:bs_admin, "--root=#{@apptmp}/sample_project") }
      skip "Check bundle install and rake"
      bundle(:install, :gemfile => "#{@apptmp}/sample_project/Gemfile", :path => "#{@apptmp}/bundle")
      cli(:rake, '-T', "-c=#{@apptmp}/sample_project")
    end
  end
end

