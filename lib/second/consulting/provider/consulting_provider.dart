import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tower_meal/common/utils/data_utils.dart';
import 'package:tower_meal/second/consulting/model/concept_model.dart';
import 'package:tower_meal/second/consulting/model/consulting_model.dart';
import 'package:tower_meal/second/consulting/model/manufacturing_model.dart';

final consultingProvider =
    StateNotifierProvider<ConsultingStateNotifier, ConsultingModel>((ref) {
  return ConsultingStateNotifier();
});

class ConsultingStateNotifier extends StateNotifier<ConsultingModel> {
  ConsultingStateNotifier()
      : super(ConsultingModel(
          id: '',
          status: ConsultingStatus.no,
        ));

  void updateConcept({
    required ConceptModel concept,
  }) {
    state = ConsultingModel(
      id: DataUtils.getUuid(),
      concept: concept,
      manufacturing: state.manufacturing,
      status: state.status,
    );
  }

  void updateManufacturing({
    required ManufacturingModel manufacturing,
  }) {
    state = ConsultingModel(
      id: DataUtils.getUuid(),
      concept: state.concept,
      manufacturing: manufacturing,
      status: state.status,
    );
  }
}
