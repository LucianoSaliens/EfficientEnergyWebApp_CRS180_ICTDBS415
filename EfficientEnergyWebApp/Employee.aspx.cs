using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EfficientEnergyWebApp
{
    /// <summary>
    /// This code will implement the functions for Employee Resgisttration Page
    /// </summary>
    public partial class Employee : System.Web.UI.Page
    {
        /// <summary>
        /// This string create the connection with the database
        /// </summary>
        private string _connectionString = "Data Source=DESKTOP-OVS77AO\\SQLAZEVEDO;Initial Catalog=EfficientEnergyDB;Integrated Security=True";
        
        /// <summary>
        /// This method runs the load of the page
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        /// The if statements:
        ///     starts the page without the Employee ID, it is gererated automatically
        ///     Delete button is inactive and will become active when it is needed
        ///     Salary is disabled once the volunteer is true
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null) Response.Redirect("Login.aspx");

            if (!IsPostBack)
            {
                hfEmployeeID.Enabled = false;
                hfEmployeeID.Text = "0";
                btnDelete.Enabled = false;
            }
            if (ddlEmployeeType.SelectedItem.Text == "Volunteer")
            {
                salary.Enabled = false;
                salary.Text = "0";
            }
        }

        /// <summary>
        /// Cleaar Fields.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }

        /// <summary>
        /// This function runs the Clear function
        /// </summary>
        /// Clear function empty all the fields when it is needed
        public void Clear()
        {
            firstName.Text = lastName.Text = "";
            dOB.Text = mobile.Text = phone.Text = email.Text = ddlEmployeeType.Text = salary.Text = "";
            lblSuccessMessage.Text = lblErrorMessage.Text = "";
        }

        /// <summary>
        /// This function insert data to a table Employee in the database
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        /// SqlCommand call the query "EmployeeCreateOrUpdate" inside the database and insert all the fields information from the user
        protected void btnSave_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(_connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("EmployeeCreateOrUpdate", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@EmployeeId", Convert.ToInt32(hfEmployeeID.Text));
                    cmd.Parameters.AddWithValue("@FirstName", firstName.Text.Trim());
                    cmd.Parameters.AddWithValue("@LastName", lastName.Text.Trim());
                    cmd.Parameters.AddWithValue("@DOB", dOB.Text.Trim());
                    cmd.Parameters.AddWithValue("@Mobile", mobile.Text.Trim());
                    cmd.Parameters.AddWithValue("@Phone", phone.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", email.Text.Trim());
                    cmd.Parameters.AddWithValue("@EmployeeType", ddlEmployeeType.SelectedItem.ToString());
                    cmd.Parameters.AddWithValue("@Salary", Convert.ToDecimal(salary.Text.Trim()));

                    con.Open();
                    var added = cmd.ExecuteNonQuery();
                    con.Close();
                    //Clear();

                    if (added > 0)
                        lblSuccessMessage.Text = "Saved Successfully";

                    gvEmployee.DataBind();

                    Page.Response.Redirect(Page.Request.Url.ToString(), true);

                }
            }

        }

        /// <summary>
        /// This function implement show all the information from the database by ID
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        ///  SqlCommand call the query "EmployeeViewByID" inside the database and show all the fields information from the table in the database in the gridview
        protected void lnk_OnClick(object sender, EventArgs e)
        {

            using (SqlConnection con = new SqlConnection(_connectionString))
            {
                using (SqlDataAdapter sqlDa = new SqlDataAdapter("EmployeeViewByID", con))
                {
                    sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;

                    int employeeId = Convert.ToInt32((sender as LinkButton).CommandArgument);

                    sqlDa.SelectCommand.Parameters.AddWithValue("@EmployeeId", employeeId);
                    DataTable dtbl = new DataTable();
                    sqlDa.Fill(dtbl);
                    con.Close();

                    hfEmployeeID.Text = employeeId.ToString();
                    firstName.Text = dtbl.Rows[0]["FirstName"].ToString();
                    lastName.Text = dtbl.Rows[0]["LastName"].ToString();
                    dOB.Text = dtbl.Rows[0]["DOB"].ToString();
                    mobile.Text = dtbl.Rows[0]["Mobile"].ToString();
                    phone.Text = dtbl.Rows[0]["Phone"].ToString();
                    email.Text = dtbl.Rows[0]["Email"].ToString();
                    ddlEmployeeType.Text = dtbl.Rows[0]["EmployeeType"].ToString();
                    salary.Text = dtbl.Rows[0]["Salary"].ToString();
                    btnSave.Text = "Update";
                    btnDelete.Enabled = true;
                }
            }

        }

        /// <summary>
        /// This function delete Employee from the database
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        /// SqlCommand call the query "EmployeeDeleteByID" inside the database and delete by ID an Employee from the table in the database
        protected void btnDelete_Click(object sender, EventArgs e)
        {

            using (SqlConnection con = new SqlConnection(_connectionString))
            {
                using (SqlCommand sqlCmd = new SqlCommand("EmployeeDeleteByID", con))
                {
                    con.Open();
                    sqlCmd.CommandType = CommandType.StoredProcedure;

                    sqlCmd.Parameters.AddWithValue("@EmployeeId", Convert.ToInt32(hfEmployeeID.Text));
                    sqlCmd.ExecuteNonQuery();
                    con.Close();
                    Clear();

                    lblSuccessMessage.Text = "Deleted Successfully";

                    Page.Response.Redirect(Page.Request.Url.ToString(), true);
                }
            }

        }

        /// <summary>
        /// This function activate the selection from gridview
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void gvEmployee_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnDelete.Enabled = true;

            hfEmployeeID.Text = gvEmployee.SelectedRow.Cells[1].Text;
            firstName.Text = gvEmployee.SelectedRow.Cells[2].Text;
            lastName.Text = gvEmployee.SelectedRow.Cells[3].Text;
            dOB.Text = gvEmployee.SelectedRow.Cells[4].Text;
            mobile.Text = gvEmployee.SelectedRow.Cells[5].Text;
            phone.Text = gvEmployee.SelectedRow.Cells[6].Text;
            email.Text = gvEmployee.SelectedRow.Cells[7].Text;
            ddlEmployeeType.Text = gvEmployee.SelectedRow.Cells[8].Text;
            salary.Text = gvEmployee.SelectedRow.Cells[9].Text;

        }

        /// <summary>
        /// This function goes to Home page which is Login page
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}