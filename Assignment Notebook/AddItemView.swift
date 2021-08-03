//
//  AddItemView.swift
//  Assignment Notebook
//
//  Created by Wyatt Knepp on 8/3/21.
//

import SwiftUI

struct AddItemView: View {
	
	@ObservedObject var assignmentList: AssignmentList
	
	@State private var course = ""
	@State private var description = ""
	@State private var dueDate = Date()
	
	@Environment(\.presentationMode) var presentationMode
	static let courses = ["CS", "Calc", "Stats"]
	
	var body: some View {
		NavigationView {
			Form {
				Picker("course", selection: $course) {
					ForEach(Self.courses, id: \.self) { course in
						Text(course)
					}
				}
				
				TextField("Description", text: $description)
				DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
			}
			

			.navigationBarTitle("Add New To-Do Item", displayMode: .inline)
			
			.navigationBarItems(trailing: Button("Save") {
					  if course.count > 0 && description.count > 0 {
					      let item = AssignmentItem(id: UUID(), course: course,
								     description: description, dueDate: dueDate)
					      assignmentList.items.append(item)
					      presentationMode.wrappedValue.dismiss()
					  }
				     })
			
		}
	}
}

struct AddItemView_Previews: PreviewProvider {
	static var previews: some View {
		AddItemView(assignmentList: AssignmentList())
	}
}

