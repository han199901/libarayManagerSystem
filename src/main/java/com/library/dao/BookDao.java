package com.library.dao;

import com.library.pojo.Books;
import com.library.pojo.HopeList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Repository
public class BookDao {
    private JdbcTemplate jdbcTemplate;
    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private static final String GET_BY_NAME = "SELECT * FROM books WHERE name like concat('%',?,'%')";
    private static final String GET_POPULAR_BOOK = "SELECT * FROM books ORDER BY `like` LIMIT 8";
    private static final String UPDATE_STATUS_FALSE = "UPDATE `books` SET `status` = 0 WHERE `index` = ?";
    private static final String GET_BOOK_NAME = "SELECT name FROM books ";
    private static final String GET_BOOK_INDEX= "SELECT `index` FROM books WHERE `name` = ?";
    private static final String GET_ALL_BOOK = "SELECT books.id bid,`index`,books.`name` bname,description,book_type.`name` btname,author,ISBN,books.type_index typeindex,entry_time,`status`,publish,`like`,locate,price,ruin_time FROM books,book_type WHERE books.type_index = book_type.type_index ";
    private static final String DEL_BOOK= "UPDATE `books` SET `status` = 2,ruin_time = NOW() WHERE `index` = ?";
    private static final String GET_BOOK_BY_ID = "SELECT books.id bid,`index`,books.`name` bname,description,book_type.`name` btname,author,ISBN,books.type_index typeindex,entry_time,`status`,publish,`like`,locate,price,ruin_time FROM books,book_type WHERE books.type_index = book_type.type_index AND `index`=?";
    private static final String ADD = "UPDATE `books` SET `index`=?,`name`=?,description=?,author=?,ISBN=?,type_index=?,`status`=?,publish=?,locate=?,price=? WHERE id=?";
    private static final String UPDATE = "INSERT INTO books (`index`,`name`,description,author,ISBN,type_index,entry_time,`status`,publish,`like`,locate,price,ruin_time) VALUES (?,?,?,?,?,?,?,?,?,0,?,?,?)";

    public List<Map<String, Object>> getByName(String name) {
        return jdbcTemplate.queryForList(GET_BY_NAME,name);
    }

    public List<Map<String, Object>> getPopularBook() {
        return jdbcTemplate.queryForList(GET_POPULAR_BOOK);
    }

    public int updateStatusFalse(int index) {
        return jdbcTemplate.update(UPDATE_STATUS_FALSE,index);
    }

    public List<Map<String, Object>> getBookName() {
        return jdbcTemplate.queryForList(GET_BOOK_NAME);
    }

    public List<Map<String, Object>> getBookIndex(String name) {
        return  jdbcTemplate.queryForList(GET_BOOK_INDEX,new Object[]{name});
    }

    public List<Map<String, Object>> getAllBook() {
        return  jdbcTemplate.queryForList(GET_ALL_BOOK);
    }

    public int abandon(int index) {
        return  jdbcTemplate.update(DEL_BOOK,new Object[]{index});
    }
    public List<Map<String, Object>> getBookById(int id) {
        return  jdbcTemplate.queryForList(GET_BOOK_BY_ID,new Object[]{id});
    }
    public void addBook(Books books) {
        Calendar date = Calendar.getInstance();
        String year = String.valueOf(date.get(Calendar.YEAR));
        /*获取当前时间*/
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        Date date1 = new Date();
        String start_time = dateFormat.format(date1);

        /*生成过期时间*/
        Calendar cal = Calendar.getInstance();
        cal.setTime(date1);//设置起时间
        cal.add(Calendar.YEAR, 10);//增加十年
        String end_time = dateFormat.format(cal.getTime());
        this.jdbcTemplate.update(ADD, books.getIndex(),books.getName(),books.getDescription(),books.getAuthor(),books.getISBN(),books.getType_index(),start_time,books.getStatus(),books.getPublish(),books.getLocate(),books.getPrice(),end_time);
    }
    public void update(Books books,int id) {
        this.jdbcTemplate.update(ADD, books.getIndex(),books.getName(),books.getDescription(),books.getAuthor(),books.getISBN(),books.getType_index(),books.getStatus(),books.getPublish(),books.getLocate(),books.getPrice(),id);
    }
}
