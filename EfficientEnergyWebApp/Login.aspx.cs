using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Windows;
using System.Web.Security;
using System.Security.Cryptography;
using System.Text;

namespace EfficientEnergyWebApp
{
    public partial class Login : System.Web.UI.Page
    {
        /// <summary>
        ///  This loads the page and all conditions implementd.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnUserRegister.Enabled = false;
                btnEmployee.Enabled = false;
                btnResgister.Enabled = false;
            }            
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
        /// String to create connection to the DB.
        /// </summary>
        public string conString = "Data Source=DESKTOP-OVS77AO\\SQLAZEVEDO;Initial Catalog=EfficientEnergyDB;Integrated Security=True";
        
        /// <summary>
        /// On login button clicked, execute this function.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                string strSQL = "SELECT txtUserName, txtUserPassword FROM [tblUser] WHERE UserName=@UserName";SqlConnection con = new SqlConnection(conString);

                SqlDataAdapter sda = new SqlDataAdapter("SELECT COUNT(*) FROM tblUser WHERE UserName='" + txtUserName.Text + "' AND Password='" + txtPassword.Text + "'", con);
                
                con.Open();
                if (con.State == System.Data.ConnectionState.Open)
                {
                    DataTable dt = new DataTable(); //this is creating a virtual table  
                    sda.Fill(dt);

                    if (txtUserName.Text == "Admin" & dt.Rows[0][0].ToString() == "1")
                    {
                        MessageBox.Show("Allowed access by Admin!");

                        btnUserRegister.Enabled = true;
                        btnEmployee.Enabled = true;

                        Session["UserName"] = txtUserName;

                    }
                    else if (txtUserName.Text != "Admin" & dt.Rows[0][0].ToString() == "1")
                    {
                        MessageBox.Show("Allowed access!");

                        btnResgister.Enabled = true;
                    }
                    else
                    {
                        MessageBox.Show("Invalid username or password");
                    }
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.ToString());
            }
        }

        /// <summary>
        /// On login button clicked, execute this function.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnUserRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("User.aspx");
        }

        /// <summary>
        /// On Employee button clicked, redirect to Employee.aspx.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnEmployee_Click(object sender, EventArgs e)
        {
            Response.Redirect("Employee.aspx");
        }

        /// <summary>
        /// On Register button clicked, redirect to Register.aspx.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnResgister_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

        /// <summary>
        /// This pass the txtPassword data typed by the user to an encryted data to the DB.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void txtPassword_TextChanged(object sender, EventArgs e)
        {
            txtPassword.Text = Encryption(txtPassword.Text);
        }
    }
}