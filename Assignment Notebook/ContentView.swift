//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Wyatt Knepp on 7/28/21.
//

import SwiftUI

struct ContentView: View {
	@ObservedObject var assignmentList = AssignmentList()
	@State private var showingAddItemView = false
	var body: some View {
		ZStack {
			NavigationView {
				List {
					ForEach(assignmentList.items) { item in
						ZStack {
							HStack {
								VStack {
									
									Text(item.description)
										.frame(alignment: .leading)
									Text(item.course)
										.bold()
										.frame(alignment: .leading)
								}
								Spacer()
								Text(item.dueDate, style: .date)
							}
						}
					}
					.onMove(perform: { indices, newOffset in
						assignmentList.items.move(fromOffsets: indices, toOffset: newOffset)
					})
					.onDelete(perform: { indexSet in
						assignmentList.items.remove(atOffsets: indexSet)
					})
					
				}
				.sheet(isPresented: $showingAddItemView, content: {
						  AddItemView(assignmentList: assignmentList)
					     })
				.navigationBarTitle("Assigments", displayMode: .inline)
				.navigationBarItems(leading: EditButton(),
								    trailing: Button(action: {
									 showingAddItemView = true}) {
									 Image(systemName: "plus")
					     })
			}
		}
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
