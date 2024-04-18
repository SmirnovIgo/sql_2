package org.example.sql_2;

import java.io.*;
import java.sql.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String url = "jdbc:mysql://localhost:3306/webdbjava";
        String user = "root";
        String pass = "";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(url, user, pass)) {
                String createTableSQL = "CREATE TABLE IF NOT EXISTS notebooks (" +
                                   "id INT AUTO_INCREMENT PRIMARY KEY," +
                                   "manufacturer VARCHAR(100)," +
                                   "notebook_name VARCHAR(100)," +
                                   "page_count INT," +
                                    "cover_type ENUM('Тверда', 'М\'яка')," +
                                  "country VARCHAR(100)," +
                                    "page_layout ENUM('Клітинка', 'Лінійка', 'Порожньо'))";
                String comandRead = "select * from Product";
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery(comandRead);
//                statement.executeUpdate(comandWrite);
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.println("<html><body>");
                out.println("<h1>" + "Write create" + "</h1>");
                out.println("<table>");
                out.println("<tr> <th> id </th> <th> name </th> <th> manufacturer </th> <th> notebook_name </th> <th> number_of_pages </th> <th> cover_type </th> <th> manufacturer_country </th> <th> page_layout </th> </tr> ");
                while (resultSet.next()){
                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("");
                    String description = resultSet.getString("");
                    double price = resultSet.getDouble("");
                    out.println("<tr> <td> "+id+"</td> <td> "+name+" </td> <td>"+description+"</td> <td>"+price+"</td> </tr> ");
                }
                out.println("</table>");
                out.println("</body></html>");



            }
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }


    }


    public void destroy() {
    }
}



class NotebookDatabaseApp {
    // JDBC URL, username і password для вашої бази даних
    static final String JDBC_URL = "jdbc:mysql://localhost:3306/notebooks";
    static final String USERNAME = "username";
    static final String PASSWORD = "password";

    public static void main(String[] args) {
        try(Connection connection = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD)) {
            // Запит для відображення всього вмісту таблиці "Блокноти"
            String selectAllQuery = "SELECT * FROM notebooks";
            try(Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery(selectAllQuery)) {
                System.out.println("Вміст таблиці 'Блокноти':");
                while(resultSet.next()) {
                    System.out.println("ID: " + resultSet.getInt("id"));
                    System.out.println("Фірма виробника: " + resultSet.getString("manufacturer"));
                    System.out.println("Назва блокнота: " + resultSet.getString("notebook_name"));
                    System.out.println("Кількість сторінок: " + resultSet.getInt("page_count"));
                    System.out.println("Тип обкладинки: " + resultSet.getString("cover_type"));
                    System.out.println("Країна виробника: " + resultSet.getString("country"));
                    System.out.println("Зовнішній вигляд сторінки: " + resultSet.getString("page_layout"));
                    System.out.println("--------------------------------------");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            // Запит для виведення унікальних країн-виробників
            String selectCountriesQuery = "SELECT DISTINCT country FROM notebooks";
            try(Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery(selectCountriesQuery)) {
                System.out.println("Країни-виробники:");
                while(resultSet.next()) {
                    System.out.println(resultSet.getString("country"));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            // Запит для виведення назв виробників та кількості блокнотів кожного виробника
            String selectManufacturersQuery = "SELECT manufacturer, COUNT(*) AS notebook_count FROM notebooks GROUP BY manufacturer";
            try(Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery(selectManufacturersQuery)) {
                System.out.println("Виробники та кількість блокнотів:");
                while(resultSet.next()) {
                    System.out.println(resultSet.getString("manufacturer") + ": " + resultSet.getInt("notebook_count"));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

