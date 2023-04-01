import 'package:flutter/cupertino.dart';
import 'package:flutter_playground/workout_app/models/exercise.dart';

import '../models/workout.dart';

class WorkoutData extends ChangeNotifier {

  List<Workout> worloutList = [
    Workout(name:  'Upper Boby',
        exercises: [
      Exercise(
          name: 'Bicep Curls',
          weight: '10',
          reps: '10',
          sets: '3',

    )
        ]
    )
    
  ];
  List<Workout> getWorkoutList() {
    return worloutList;
  }

  int numberofExercisesInWorkout(String workoutName) {
    Workout relevantWorkout = getRelevantWorkout(workoutName);

    return relevantWorkout.exercises.length;
  }
  
  void addWorkout(String name) {
    worloutList.add(Workout(name: name, exercises: []));

    notifyListeners();

  }
 
  void addExercise(String workoutName,String exerciseName,String weight,String reps,String sets) {
    Workout relevantWorkout =
        getRelevantWorkout(workoutName);
    
    relevantWorkout.exercises
    .add(Exercise(name: exerciseName, weight: weight, reps: reps, sets: sets));
    notifyListeners();
  }

   void checkoffExercise (String workoutName, String exerciseName)  {
     Exercise relevantExercise = getRelevantExercise(workoutName, exerciseName);

     relevantExercise.isCompleted = !relevantExercise.isCompleted;

     notifyListeners();
   }

   Workout getRelevantWorkout(String workoutName) {
    Workout relevantWorkout =
        worloutList.firstWhere((workout) => workout.name == workoutName);

    return relevantWorkout;
   }

   Exercise getRelevantExercise(String workoutName, String exerciseName) {
    Workout relevantWorkout = getRelevantWorkout(workoutName);

    Exercise relevantExercise = relevantWorkout.exercises
    .firstWhere((exercise) => exercise.name == exerciseName);

    return relevantExercise;
   }


}
