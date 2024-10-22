import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../product/state/block/doctorCubit/doctor_cubit.dart';
import '../widget/doctor_card.dart';

class SeeAllDoctorsV2 extends StatefulWidget {
  const SeeAllDoctorsV2({super.key});

  @override
  State<SeeAllDoctorsV2> createState() => _SeeAllDoctorsV2State();
}

class _SeeAllDoctorsV2State extends State<SeeAllDoctorsV2> {
  late String _selectedFilter = 'name';
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Doctors'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.05),
            head(width),
            SizedBox(height: height * 0.02),
            doctorCard(width),
          ],
        ),
      ),
    );
  }

  // Doktor kartlarının listelenmesi
  Expanded doctorCard(double width) {
    return Expanded(
      child: BlocBuilder<DoctorCubit, DoctorState>(
        builder: (context, state) {
          if (state is DoctorLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is DoctorLoaded) {
            final filteredDoctors = state.doctors.where((doctor) {
              switch (_selectedFilter) {
                case 'name':
                  return doctor.name
                      .toLowerCase()
                      .contains(searchQuery.toLowerCase());
                case 'specialty':
                  return doctor.specialty
                      .toLowerCase()
                      .contains(searchQuery.toLowerCase());
                case 'currentWorkplace':
                  return doctor.currentWorkplace
                      .toLowerCase()
                      .contains(searchQuery.toLowerCase());
                default:
                  return true;
              }
            }).toList();

            return ListView.builder(
              itemCount: filteredDoctors.length,
              itemBuilder: (context, index) {
                final doc = filteredDoctors[index];
                return DoctorCard(
                  doctorModel: doc,
                  width: width,
                );
              },
            );
          }

          return const Center(child: Text('Data not found'));
        },
      ),
    );
  }

  // Arama ve filtre seçenekleri
  Row head(double width) {
    return Row(
      children: [
        SizedBox(
          width: width * 0.5,
          child: customTextfield(),
        ),
        const Spacer(),
        DropdownButtonW(
          onChanged: (value) {
            setState(() {
              _selectedFilter = value!; // Seçilen filtreyi güncelle
            });
            if (kDebugMode) {
              print('Selected filter: $_selectedFilter');
            }
          },
        ),
      ],
    );
  }

  TextField customTextfield() {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.search_rounded),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
            color: Color(0xff3E69FE), // Focus durumunda sınır rengi
            width: 2.0, // Sınır kalınlığı
          ),
        ),
      ),
      onChanged: (value) {
        setState(() {
          searchQuery = value;
        });
      },
    );
  }
}

// Dropdown widget'ı
class DropdownButtonW extends StatefulWidget {
  const DropdownButtonW({
    super.key,
    required this.onChanged,
  });

  final ValueChanged<String?> onChanged;

  @override
  State<DropdownButtonW> createState() => _DropdownButtonWState();
}

class _DropdownButtonWState extends State<DropdownButtonW> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      borderRadius: BorderRadius.circular(20),
      dropdownColor: Colors.grey[200],
      icon: const Icon(Icons.arrow_circle_down_rounded),
      value: selectedValue,
      hint: const Text('Filtre'),
      items: const [
        DropdownMenuItem(value: 'name', child: Text('Name')),
        DropdownMenuItem(value: 'specialty', child: Text('Specialty')),
        DropdownMenuItem(
            value: 'currentWorkplace', child: Text('Current Workplace')),
      ],
      onChanged: (value) {
        setState(() {
          selectedValue = value; // Seçilen değeri güncelle
        });
        widget.onChanged(value); // Seçimi üst widget'a ilet
      },
    );
  }
}
