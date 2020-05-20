using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;


namespace sample
{
    public partial class WebForm1 : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(
            WebConfigurationManager.ConnectionStrings["mydb"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Bdelete.Enabled = true;
                fillgridview();
            }
        }

        protected void Bclear_Click(object sender, EventArgs e)
        {
            clear();
        }
        public void clear()
        {
            HiddenField1.Value = "";
            Txtlocation_used.Text = Txtequipment_no.Text = Txtequipment_desc.Text = Txtrange.Text= Txtaccuracy.Text= Txtfrequency.Text= Txtlast_calib_done_on.Text= Txtdue_date.Text= Txtstatus.Text=  "";
            lblsucessmessage.Text = lblerrormessage.Text = "";
            Binsert.Text = "insert";
            Bdelete.Enabled = true;
        }

        protected void Binsert_Click(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Closed)
                con.Open();


            DateTime dt = DateTime.Now;
            string Sql_Query = "insert into equipment_master(plant,section,location_used,equipment_no,equipment_desc,equipment_type,range,accuracy,frequency,last_calib_done_on,due_date,status,intimation_days) values(@plant,@section,@location_used,@equipment_no,@equipment_desc,@equipment_type,@range,@accuracy,@frequency,@last_calib_done_on,@due_date,@status,@intimation_days)";
            SqlCommand sqlcmd = new SqlCommand(Sql_Query, con);
            sqlcmd.Parameters.AddWithValue("@plant", DropDownList1.SelectedItem.Value);
            sqlcmd.Parameters.AddWithValue("@section", DropDownList2.SelectedItem.Value);
            sqlcmd.Parameters.AddWithValue("@location_used", Txtlocation_used.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@equipment_no", Txtequipment_no.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@equipment_desc", Txtequipment_desc.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@equipment_type", DropDownList3.SelectedItem.Value);
            sqlcmd.Parameters.AddWithValue("@range", Txtrange.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@accuracy", Txtaccuracy.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@frequency", Txtfrequency.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@last_calib_done_on",DateTime.Now);
            sqlcmd.Parameters.AddWithValue("@due_date", dt.AddDays(10));
            sqlcmd.Parameters.AddWithValue("@status", Txtstatus.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@intimation_days", DropDownList4.SelectedItem.Value);
            sqlcmd.ExecuteNonQuery();
            con.Close();
            clear();
            lblsucessmessage.Text = "saved successfully"; 
            
            fillgridview();
        }
        void fillgridview()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            string Sql_Query = "select * from equipment_master";
            SqlDataAdapter sqlda = new SqlDataAdapter(Sql_Query, con);
            DataTable dtb = new DataTable(); 
            sqlda.Fill(dtb);
            con.Close();
            gcalibration.DataSource = dtb;
            gcalibration.DataBind();
        }
        protected void Bupdate_Click(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Closed)
                con.Open();

            DateTime dt = DateTime.Now;
            string Sql_Query = "update equipment_master set plant=@plant,section=@section,location_used=@location_used,equipment_no=@equipment_no,equipment_desc=@equipment_desc,equipment_type=@equipment_type,range=@range,accuracy=@accuracy,frequency=@frequency,last_calib_done_on=@last_calib_done_on,due_date=@due_date,status=@status,intimation_days=@intimation_days where equipment_no=@equipment_no ";
            SqlCommand sqlcmd = new SqlCommand(Sql_Query, con);
            sqlcmd.Parameters.AddWithValue("@plant", DropDownList1.SelectedItem.Value);
            sqlcmd.Parameters.AddWithValue("@section", DropDownList2.SelectedItem.Value);
            sqlcmd.Parameters.AddWithValue("@location_used", Txtlocation_used.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@equipment_no", Txtequipment_no.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@equipment_desc", Txtequipment_desc.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@equipment_type", DropDownList3.SelectedItem.Value);
            sqlcmd.Parameters.AddWithValue("@range", Txtrange.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@accuracy", Txtaccuracy.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@frequency", Txtfrequency.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@last_calib_done_on", DateTime.Now);
            sqlcmd.Parameters.AddWithValue("@due_date", dt.AddDays(10));
            sqlcmd.Parameters.AddWithValue("@status", Txtstatus.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@intimation_days",DropDownList4.SelectedItem.Value);
            sqlcmd.ExecuteNonQuery();
            con.Close();
            clear();
            lblsucessmessage.Text = "updated successfully";
            fillgridview();
        }

        protected void Bdelete_Click(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            string Sql_Query = "delete from equipment_master where equipment_no=@equipment_no";
            SqlCommand sqlcmd = new SqlCommand(Sql_Query, con);
            sqlcmd.Parameters.AddWithValue("@equipment_no", Txtequipment_no.Text.Trim());
            sqlcmd.ExecuteNonQuery();
            con.Close();
            clear();
            fillgridview();
            lblsucessmessage.Text = "deleted successfully";

        }
    }
}
    
