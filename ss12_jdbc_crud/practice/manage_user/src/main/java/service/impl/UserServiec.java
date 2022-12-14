package service.impl;

import model.User;
import repository.IUserDAO;
import repository.impl.UserDAO;
import service.IUserServiec;

import java.sql.SQLException;
import java.util.List;

public class UserServiec implements IUserServiec {
    private IUserDAO userDAO = new UserDAO();
    @Override
    public void insertUser(User user) throws SQLException {
        userDAO.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return userDAO.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return userDAO.selectAllUsers();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return userDAO.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return userDAO.updateUser(user);
    }

    @Override
    public List<User> findByCountry(String country) {
        return userDAO.findByCountry("%" + country + "%");
    }

    @Override
    public User getUserById(int id) {
        return userDAO.getUserById(id);
    }

    @Override
    public void insertUserStore(User user) throws SQLException {
        userDAO.insertUserStore(user);
    }
}
