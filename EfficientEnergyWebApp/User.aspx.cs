using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;
using System.Security.Cryptography;
using System.Text;

namespace EfficientEnergyWebApp
{
    /// <summary>
    /// This function runs the User Registration Page.
    /// </summary>
    public partial class User : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null) Response.Redirect("Login.aspx");
        }

        /// <summary>
        /// For encrypt text of Passwords.
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public string Encryption(string value)
        {
            using (MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider())
            {
                UTF8Encoding utf8 = new UTF8Encoding();
                byte[] data = md5.ComputeHash(utf8.GetBytes(value));
                return Convert.ToBase64String(data);
            }
        }

        /// <summary>
        /// This string create the connection with the database.
        /// </summary>
        public string conString = "Data Source=DESKTOP-OVS77AO\\SQLAZEVEDO;Initial Catalog=EfficientEnergyDB;Integrated Security=True";

        /// <summary>
        /// This function insert data from the user by the fields into the table tblUser inside the database.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(conString);
                
                con.Open();
                if (con.State == System.Data.ConnectionState.Open)
                {
                    string q = "insert into tblUser(UserName, Password)values('" + txtUserName.Text.ToString() + "','" + /*hc.PassHash*/txtUserPassword.Text.ToString() + "')";
                    SqlCommand cmd = new SqlCommand(q, con);
                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Resgistered Successfully!");

                    Page.Response.Redirect(Page.Request.Url.ToString(), true);
                }
                con.Close();
            }
            catch(Exception ex)
            {
                Response.Write("Error: " + ex.ToString());
            }
        }

        /// <summary>
        /// This function delete User from the database.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        /// Delete an User from the table in the database
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            //Code for Delete...
            try
            {
                using (var sc = new SqlConnection(conString))
                using (var cmd = sc.CreateCommand())
                {
                    sc.Open();
                    cmd.CommandText = "DELETE FROM tblUser WHERE UserName = @UserName";
                    cmd.Parameters.AddWithValue("@UserName", txtUserName.Text);
                    cmd.ExecuteNonQuery();
                    sc.Close();

                    MessageBox.Show("Data record deleted!");

                    Page.Response.Redirect(Page.Request.Url.ToString(), true);
                }
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.ToString());
            }
        }

        /// <summary>
        /// This function activate the selection from gridview.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtUserName.Text = GridView1.SelectedRow.Cells[1].Text;
            //txtUserPassword.Text = GridView1.SelectedRow.Cells[2].Text;
        }

        /// <summary>
        /// This function goes to Home page which is Login page.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        /// <summary>
        /// This pass the txtUserPassword data typed by the user to an encryted data to the DB.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public void txtUserPassword_TextChanged(object sender, EventArgs e)
        {
            txtUserPassword.Text = Encryption(txtUserPassword.Text);
        }
    }
}