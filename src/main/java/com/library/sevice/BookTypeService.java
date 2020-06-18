package com.library.sevice;

import com.library.dao.BookTypeDao;
import com.library.pojo.Announcement;
import com.library.pojo.BookType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class BookTypeService {
    private BookTypeDao bookTypeDao;
    @Autowired
    public void setAnnouncementDao(BookTypeDao bookTypeDao) {
        this.bookTypeDao = bookTypeDao;
    }


    public List<BookType> getAllBookType() {
        return bookTypeDao.getAllBookType();
    }

    public boolean insert(BookType bookType) {
        return bookTypeDao.insert(bookType)==1;
    }

    public boolean update(BookType bookType) {
        return bookTypeDao.update(bookType)==1;
    }

    public BookType getABookType(int id) {
        return bookTypeDao.getBookTypeById(id);
    }

    public boolean del(int id) {
        return bookTypeDao.delBookTypeById(id)==1;
    }
}
