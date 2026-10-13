package dao;

import model.FavoriteBean;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class FavoriteDAO {

    // Check Favorite
    public boolean isFavorite(int userId, int bookId) {

        boolean favorite = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                    "SELECT * FROM favorites WHERE user_id=? AND book_id=?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, userId);
            ps.setInt(2, bookId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                favorite = true;

            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return favorite;

    }

    // Add Favorite
    public void addFavorite(FavoriteBean favorite) {

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                    "INSERT INTO favorites(user_id,book_id) VALUES(?,?)";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, favorite.getUser_id());

            ps.setInt(2, favorite.getBook_id());

            ps.executeUpdate();

        } catch (Exception e) {

            e.printStackTrace();

        }

    }

    // Remove Favorite
    public void removeFavorite(int userId, int bookId) {

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                    "DELETE FROM favorites WHERE user_id=? AND book_id=?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, userId);

            ps.setInt(2, bookId);

            ps.executeUpdate();

        } catch (Exception e) {

            e.printStackTrace();

        }

    }

    // Toggle Favorite
    public void toggleFavorite(int userId, int bookId) {

        if (isFavorite(userId, bookId)) {

            removeFavorite(userId, bookId);

        } else {

            FavoriteBean favorite =
                    new FavoriteBean();

            favorite.setUser_id(userId);

            favorite.setBook_id(bookId);

            addFavorite(favorite);

        }

    }

    // Count Favorites for Book
    public int getFavoriteCount(int bookId) {

        int count = 0;

        try {

            Connection con =
                    DBConnection.getConnection();

            String sql =
                    "SELECT COUNT(*) FROM favorites WHERE book_id=?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, bookId);

            ResultSet rs =
                    ps.executeQuery();

            if (rs.next()) {

                count = rs.getInt(1);

            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return count;

    }

}