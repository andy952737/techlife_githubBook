namespace :schedule do 
  
    #現在應該很多人為了突破原始session 4kb限制使用了RAILS的DB session，但是隨著時間越來越長那個表會越長越大，必須定期清除，這段CODE可以配合時間排程定期清除24小時前的session，避免專案在未來user夠多時資料庫急遽長大。
    desc "Clear expired sessions"
        task :clear_expired_sessions => :environment do
        sql = 'DELETE FROM sessions WHERE updated_at < DATE_SUB(NOW(), INTERVAL 1 DAY);'
        ActiveRecord::Base.connection.execute(sql)
    end   

end