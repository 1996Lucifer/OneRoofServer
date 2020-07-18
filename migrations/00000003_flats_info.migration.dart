import 'dart:async';
import 'package:aqueduct/aqueduct.dart';

class Migration3 extends Migration {
  @override
  Future upgrade() async {
    database.createTable(SchemaTable("_FlatsInfo", [
      SchemaColumn("flatId", ManagedPropertyType.integer,
          isPrimaryKey: true,
          autoincrement: true,
          isIndexed: false,
          isNullable: false,
          isUnique: true),
      SchemaColumn("flatInfo", ManagedPropertyType.document,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: true)
    ]));
  }

  @override
  Future downgrade() async {}

  @override
  Future seed() async {
    await database.store.execute(
      "INSERT INTO _FlatsInfo (flatInfo) VALUES (@flatInfo)",
      substitutionValues: {
        "flatInfo": {
          "address": "Kailash hills, New Delhi - South, Delhi NCR",
          "availability_status": "Immediately",
          "bathrooms": "3",
          "bedrooms": "3",
          "description": '''Good park and pool facing location.
                                Fresh and very spacious flat.
                                All wooden work completed in both bedrooms.
                                Modular kitchen with chimney and r.O
                                All amenities are available like covered car parking, club membership, power backup, lifts, gym, swimming pool, cctv security ,intercom facility etc..
                                Walking distance from main marke, schools, gas station, petrol pump, police station, kfc, police station, etc..

                                Contact us for more details....''',
          "electricity_water_charges": "Charges not included",
          "floor": "2 (Out of 3 Floors)",
          "furnished_status": "Well Furnished",
          "owner_contact": "9898989898",
          "rent": "10000",
          "rent_agreement_duration": "11 MonthsMonths of Notice: 1 Months",
          "tenants_preferred": "All"
        }
      },
    );
  }
}
