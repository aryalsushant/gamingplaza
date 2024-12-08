using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace login
{
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }

        private void btnSignUp_Click(object sender, EventArgs e)
        {
            string connectString = @"Data Source=ANKIII\SQLEXPRESS;Initial Catalog=LoginDb;Integrated Security=True;";
            using (SqlConnection conn = new SqlConnection(connectString))
            {
                try
                {
                    conn.Open();
                    string query = "INSERT INTO USERS (Email, Username, Password) VALUES (@email,@username,@password)";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@email", Email1.Text);
                    cmd.Parameters.AddWithValue("@username", userNameTextBox.Text);
                    cmd.Parameters.AddWithValue("@password", passwordTextBox.Text);


                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Registration Successful");
                    Email1.Text = string.Empty;
                    userNameTextBox.Text = string.Empty;
                    passwordTextBox.Text = string.Empty;

                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
                finally
                {
                    if (conn.State == System.Data.ConnectionState.Open)
                    {
                        conn.Close();
                    }
                }


            }
        }

        private void btnSignIn_Click(object sender, EventArgs e)
        {
            Form1 loginForm = new Form1();
            loginForm.Show();
            this.Hide();
        }

        private void label4_Click(object sender, EventArgs e)
        {

        }
    }
}
