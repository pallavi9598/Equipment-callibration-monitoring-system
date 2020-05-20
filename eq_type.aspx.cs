using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sample
{
    public partial class eq_type : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(
           WebConfigurationManager.ConnectionStrings["mydb"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Bdisplay.Enabled = true;
                fillgridview();
            }
        }
        public void clear()
        {
            HiddenField1.Value = "";
            TextBox5.Text = TextBox6.Text = "";
            lblsucessmessage.Text = lblerrormessage.Text = "";
            Bdisplay.Enabled = true;
            Bsave.Enabled = true;
        }
        protected void Bsave_Click(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            string Sql_Query = "insert into equipment_master(plant,section,location_used,equipment_no,equipment_type) values(@plant,@section,@location_used,@equipment_no,@equipment_type)";
            SqlCommand sqlcmd = new SqlCommand(Sql_Query, con);
            sqlcmd.Parameters.AddWithValue("@plant", DropDownList1.SelectedItem.Value);
            sqlcmd.Parameters.AddWithValue("@section", DropDownList2.SelectedItem.Value);
            sqlcmd.Parameters.AddWithValue("@location_used", TextBox5.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@equipment_no", TextBox6.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@equipment_type", DropDownList3.SelectedItem.Value);
            sqlcmd.ExecuteNonQuery();
            con.Close();
            lblsucessmessage.Text = "saved successfully";

            fillgridview();
        }
        void fillgridview()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            string Sql_Query = "select plant,section,equipment_no,equipment_desc,location_used,equipment_type,last_calib_done_on,due_date from equipment_master";
            SqlDataAdapter sqlda = new SqlDataAdapter(Sql_Query, con);
            DataTable dtb = new DataTable();
            sqlda.Fill(dtb);
            con.Close();
            GridView1.DataSource = dtb;
            GridView1.DataBind();
        }

        protected void Bdisplay_Click(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            string Sql_Query = "select plant,section,equipment_no,equipment_desc,location_used,equipment_type,last_calib_done_on,due_date from equipment_master where equipment_no=@equipment_no";
            SqlCommand sqlcmd = new SqlCommand(Sql_Query, con);
            sqlcmd.Parameters.AddWithValue("@equipment_no", TextBox6.Text.Trim());
            sqlcmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(sqlcmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            clear();
            con.Close();

            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
                lblsucessmessage.Text = "data exists";
            }
            else
            {
                GridView1.DataSource ="";
                GridView1.DataBind();
                lblerrormessage.Text = "not exists...enter new data";

            }
               

            
            //fillgridview();
        }
        
    }
}