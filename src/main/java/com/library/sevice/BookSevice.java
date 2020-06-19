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
    public List<Map<String, Object>> allBooksData() {
        List<Map<String, Object>> result = bookDao.getAllBook();
        for (Map<String, Object> i : result) {
            int a = (int) i.get("status");
            if (a == 0) {
                i.put("statusname","不可借");
            } else if (a == 1) {
                i.put("statusname","可借");
            } else {
                i.put("statusname","已废弃");
            }
        }
        return result;
    }

}
