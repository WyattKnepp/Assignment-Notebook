//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Wyatt Knepp on 7/28/21.
//

import SwiftUI

struct ContentView: View {
	@State private var assignmentItems = [
		AssignmentItem(course: "Computer Science", description: "Description here", dueDate: Date()),
		
		AssignmentItem(course: "Computer Science", description: "Description 2 here", dueDate: Date()),
		
		AssignmentItem(course: "Computer Science test 2", description: "Description 3 here", dueDate: Date())
	]
	var body: some View {
		Text("Hello, world!")
			.padding()
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}

struct AssignmentItem: Identifiable, Codable {
	var id = UUID()
	var course = String()
	var description = String()
	var dueDate = Date()
}
