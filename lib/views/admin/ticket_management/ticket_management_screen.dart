// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:guideme/core/constants/colors.dart';
// import 'package:guideme/models/category_model.dart';
// import 'package:guideme/models/ticket_model.dart';
// import 'package:guideme/widgets/custom_button.dart';
// import 'package:guideme/widgets/custom_navbar.dart';
// import 'package:guideme/widgets/custom_title.dart';

// class TicketManagementScreen extends StatefulWidget {
//   const TicketManagementScreen({super.key});

//   @override
//   _TicketManagementScreenState createState() => _TicketManagementScreenState();
// }

// class _TicketManagementScreenState extends State<TicketManagementScreen> {
//   // final CategoryController _categoryController = CategoryController();
//   String page = 'ticket';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Ticket Management"),
//       ),
//       body: TicketManagementScreenContent(),
//       floatingActionButton: Padding(
//         padding: const EdgeInsets.only(bottom: 80.0),
//         child: AddButton(page),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.endDocked, // Posisi di kanan bawah
//       bottomNavigationBar: AdminBottomNavBar(selectedIndex: 0),
//     );
//   }
// }

// class TicketManagementScreenContent extends StatelessWidget {
//   TicketManagementScreenContent({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return NestedScrollView(
//       headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//         return [
//           SliverToBoxAdapter(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 CustomTitle(
//                   firstText: 'Hi, Admin!',
//                   secondText: 'Design your data exactly how you want it',
//                 ),
//                 SizedBox(
//                   height: 16,
//                 )
//               ],
//             ),
//           ),
//         ];
//       },
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance.collection('tickets').snapshots(),
//         builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }
//           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             return Center(child: Text('No data available'));
//           }
//           return ListView.builder(
//             itemCount: snapshot.data!.docs.length,
//             itemBuilder: (context, index) {
//               var doc = snapshot.data!.docs[index];
//               Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
//               try {
//                 TicketModel ticket = TicketModel.fromMap(data, doc.id);
//                 print(ticket);

//                 return Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 12),
//                   child: Container(
//                     width: MediaQuery.of(context).size.width,
//                     child: Card(
//                       elevation: 5,
//                       color: AppColors.backgroundColor, // Background untuk card
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start, // Mengatur posisi elemen vertikal
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(10.0), // Memberikan border melengkung pada gambar
//                             child: Image.network(
//                               ticket.imageUrl ?? 'Image not found', // URL gambar
//                               width: 160, // Lebar gambar
//                               height: 170, // Tinggi gambar
//                               fit: BoxFit.cover, // Menyesuaikan gambar agar sesuai kotak
//                             ),
//                           ),
//                           SizedBox(width: 12), // Memberikan jarak antara gambar dan teks
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start, // Posisi teks rata kiri
//                               children: [
//                                 Text(
//                                   ticket.name ?? 'Name not found', // Judul tiket
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 SizedBox(height: 8), // Jarak antara teks
//                                 Text(
//                                   (ticket.rating ?? 0.0).toString(), // Deskripsi tiket
//                                   style: TextStyle(fontSize: 14, color: Colors.grey),
//                                   maxLines: 3, // Batas maksimal 3 baris
//                                   overflow: TextOverflow.ellipsis, // Tambahkan "..." jika teks terlalu panjang
//                                 ),
//                                 SizedBox(height: 12), // Jarak sebelum tombol
//                                 Row(
//                                   children: [
//                                     ElevatedButton(
//                                       onPressed: () {
//                                         // Aksi tombol
//                                       },
//                                       child: Text("Detail"),
//                                     ),
//                                     SizedBox(width: 8),
//                                     ElevatedButton(
//                                       onPressed: () {
//                                         // Aksi tombol lain
//                                       },
//                                       child: Text("Pesan"),
//                                     ),
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               } catch (e) {
//                 return Center(child: Text('Error parsing ticket data: $e'));
//               }
//             },
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:guideme/core/constants/colors.dart';
import 'package:guideme/core/constants/icons.dart';
import 'package:guideme/core/constants/text_styles.dart';
import 'package:guideme/core/utils/text_utils.dart';
import 'package:guideme/models/ticket_model.dart';
import 'package:guideme/widgets/custom_button.dart';
import 'package:guideme/widgets/custom_navbar.dart';
import 'package:guideme/widgets/custom_title.dart';
import 'package:intl/intl.dart';

class TicketManagementScreen extends StatefulWidget {
  const TicketManagementScreen({super.key});

  @override
  _TicketManagementScreenState createState() => _TicketManagementScreenState();
}

class _TicketManagementScreenState extends State<TicketManagementScreen> {
  String page = 'ticket';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ticket Management"),
      ),
      body: TicketManagementScreenContent(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 80.0),
        child: AddButton(page),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked, // Posisi di kanan bawah
      bottomNavigationBar: AdminBottomNavBar(selectedIndex: 0),
    );
  }
}

class TicketManagementScreenContent extends StatelessWidget {
  TicketManagementScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTitle(
                  firstText: 'Hi, Admin!',
                  secondText: 'Design your data exactly how you want it',
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ];
      },
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('tickets').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No data available'));
          }

          // Pastikan data tidak null
          var docs = snapshot.data!.docs;
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              var doc = snapshot.data!.docs[index];
              Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
              try {
                TicketModel ticket = TicketModel.fromMap(data, doc.id);

                String formattedDate = '';
                String formattedTime = '';
                if (ticket.openingTime != null) {
                  DateTime openingTime = ticket.openingTime!.toDate();

                  // Memformat tanggal
                  formattedDate = DateFormat('dd MMM yyyy').format(openingTime); // Contoh: 11 Jun 2024

                  // Memformat waktu
                  formattedTime = DateFormat('hh:mm a').format(openingTime); // Contoh: 07.00 PM
                }

                return Container(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Card(
                      elevation: 5,
                      color: AppColors.backgroundColor, // Background untuk card
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: Image.network(
                                    ticket.imageUrl ?? 'Image not found', // URL gambar
                                    width: 124, // Lebar mengikuti lebar layar
                                    height: 124, // Tinggi gambar
                                    fit: BoxFit.cover, // Menyesuaikan gambar agar sesuai kotak
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    capitalizeEachWord(ticket.name ?? 'Name not found'),
                                    style: AppTextStyles.mediumStyle.copyWith(fontWeight: FontWeight.bold),
                                    maxLines: 2, // Membatasi hanya dua baris
                                    overflow: TextOverflow.ellipsis, // Menambahkan ellipsis jika teks terlalu panjang
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        AppIcons.rating,
                                        size: 12,
                                      ),
                                      SizedBox(width: 2),
                                      Text(
                                        '${ticket.rating}',
                                        style: AppTextStyles.smallStyle.copyWith(fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'organized by',
                                        style: AppTextStyles.smallStyle,
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                        capitalizeEachWord(ticket.organizer ?? 'Organizer not found'),
                                        style: AppTextStyles.smallStyle.copyWith(fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                AppIcons.date,
                                                size: 12,
                                              ),
                                              SizedBox(width: 2),
                                              Text(
                                                formattedDate,
                                                style: AppTextStyles.smallStyle,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                AppIcons.time,
                                                size: 12,
                                              ),
                                              SizedBox(width: 2),
                                              Text(
                                                formattedTime,
                                                style: AppTextStyles.smallStyle,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                AppIcons.pin,
                                                size: 12,
                                              ),
                                              SizedBox(width: 2),
                                              Text(
                                                capitalizeEachWord(ticket.location ?? ''),
                                                style: AppTextStyles.smallStyle,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  // Column(
                                  //   children: [
                                  //     Text(
                                  //       'Starts from',
                                  //       style: AppTextStyles.tinyStyle.copyWith(color: AppColors.secondaryColor),
                                  //     ),
                                  //   ],
                                  // ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          SmallButton(
                                            onPressed: () {
                                              // Aksi tombol
                                            },
                                            label: "Detail",
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          EditButton(
                                            data: 'data',
                                            page: 'page',
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          DeleteButton(
                                            itemId: 'itemId',
                                            itemType: 'itemType',
                                            controller: 'controller',
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              } catch (e) {
                return Center(child: Text('Error parsing ticket data: $e'));
              }
            },
          );
        },
      ),
    );
  }
}
