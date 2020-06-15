package com.library.sevice;

import com.library.dao.BookDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class BookSevice {
    BookDao bookDao;
    @Autowired
    public void setBookDao(BookDao bookDao) {
        this.bookDao = bookDao;
    }

    public List<Map<String, Object>> getMostLike() {
        return bookDao.getPopularBook();
    }

    public List<Map<String, Object>> bookNameData() {
        List<Map<String, Object>> result = bookDao.getBookName();
        return result;
    }
}
