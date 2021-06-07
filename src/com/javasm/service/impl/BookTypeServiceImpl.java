package com.javasm.service.impl;

import com.javasm.bean.BookType;
import com.javasm.dao.BookTypeDao;
import com.javasm.dao.impl.BookTypeDaoImpl;
import com.javasm.service.BookTypeService;

import java.util.List;

public class BookTypeServiceImpl implements BookTypeService {
    private BookTypeDao bookTypeDao = new BookTypeDaoImpl();

    @Override
    public boolean addType(BookType bookType) {
        return bookTypeDao.addType(bookType);
    }

    @Override
    public boolean updateType(BookType bookType) {
        return bookTypeDao.updateType(bookType);
    }

    @Override
    public boolean deleteType(Integer typeId) {
        return bookTypeDao.deleteType(typeId);
    }

    @Override
    public List<BookType> findType(BookType bookType) {
//        System.out.println("TypeService!!!!"+bookTypeDao.findType(bookType));
//        System.out.println("Service是否有父类的值:!!!"+bookType.getFlagParent());
//        System.out.println("Service的父类id的值!!!!!"+bookType.getParentTypeId());
        return bookTypeDao.findType(bookType);
    }

    @Override
    public BookType findOneById(Integer id) {
        return bookTypeDao.findOneById(id);
    }
}
