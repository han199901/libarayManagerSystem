package com.library.sevice;

import com.library.dao.AnnouncementDao;
import com.library.pojo.Announcement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class NoticeService {
    private AnnouncementDao announcementDao;
    @Autowired
    public void setAnnouncementDao(AnnouncementDao announcementDao) {
        this.announcementDao = announcementDao;
    }

    public List<Announcement> getAllNotice() {
        return announcementDao.getAllAnnouncement();
    }
    public boolean insert(Announcement announcement) {
        SimpleDateFormat format = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss");//设置时间格式
        Date currentTime = new Date();//获取当前时间
        String date=format.format(new Date());//对当前时间进行格式化
        try {
            currentTime=format.parse(date);//自定义格式的时间
        } catch (ParseException e) {
            e.printStackTrace();
        }
        announcement.setStart_time(currentTime);
        return announcementDao.insert(announcement)==1;
    }

    public boolean update(Announcement announcement) {
        return announcementDao.update(announcement)==1;
    }

    public Announcement getAnnouncement(int id) {
        return announcementDao.getAnnouncementByID(id);
    }

    public boolean del(int id) {
        return announcementDao.delAnnouncementByID(id)==1;
    }
}
