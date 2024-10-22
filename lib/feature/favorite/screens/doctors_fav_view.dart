import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_cliniv_v2/product/state/block/doctorCubit/cubit/doctor_fav_cubit_cubit.dart';

class DoctorsFavView extends StatefulWidget {
  const DoctorsFavView({super.key});

  @override
  State<DoctorsFavView> createState() => _DoctorsFavViewState();
}

class _DoctorsFavViewState extends State<DoctorsFavView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        body: BlocBuilder<DoctorFavCubitCubit, DoctorFavCubitState>(
          builder: (context, state) {
            if (state is DoctorFavCubitInitial) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is DoctorFavCubitLoaded) {
              return GridView.builder(
                itemCount: state.doctors.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  var doctor = state.doctors[index];
                  var doctorindex = state.doctors.indexOf(doctor);
                  return Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.withOpacity(0.5)),
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.2,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                image: DecorationImage(
                                  image: AssetImage(doctor.photoUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 5,
                              right: 5,
                              child: IconButton(
                                onPressed: () {
                                  context
                                      .read<DoctorFavCubitCubit>()
                                      .deleteFavoriteDoctor(doctorindex);
                                },
                                icon: const Icon(Icons.delete),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                doctor.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                doctor.specialty,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
            return const Center(child: Text('bloc error'));
          },
        ));
  }
}
