using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DentalCabinet.Data
{
    class Users
    {
        public static List<Data.user> users = Core.CoreDB.dental_DbEntities.user.ToList();
    }
}
