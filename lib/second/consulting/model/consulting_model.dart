import 'concept_model.dart';
import 'manufacturing_model.dart';

enum ConsultingStatus {
  no('진행중인 컨설팅이 존재하지 않습니다.'),
  doingConcept('기획중'),
  doneConcept('기획완료'),
  doingManufacture('유통, 제조 컨설팅'),
  doneManufacture('최종 완료');

  const ConsultingStatus(this.label);

  final String label;
}

class ConsultingModel {
  final String id;
  final ConceptModel? concept;
  final ManufacturingModel? manufacturing;
  final ConsultingStatus status;

  ConsultingModel({
    required this.id,
    this.concept,
    this.manufacturing,
    required this.status,
  });

  ConsultingModel copyWith({
    String? id,
    ConceptModel? concept,
    ManufacturingModel? manufacturing,
    ConsultingStatus? status,
  }) {
    return ConsultingModel(
      id: id ?? this.id,
      concept: concept ?? this.concept,
      manufacturing: manufacturing ?? this.manufacturing,
      status: status ?? this.status,
    );
  }
}
