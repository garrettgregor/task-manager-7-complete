require 'rails_helper'

RSpec.describe Task, type: :model do
  describe "instance methods" do
    describe "#laundry?" do
      it "returns true when the title is laundry" do
        task = Task.create!(title: "laundry", description: "clean clothes")

        expect(task.laundry?).to be(true)
      end

      it "returns true when the description is laundry" do
        task = Task.create!(title: "Clean my clothes", description: "laundry")

        expect(task.laundry?).to be(true)
      end

      it "returns false when the title nor description is laundry" do
        task = Task.create!(title: "clothes", description: "clean clothes")

        expect(task.laundry?).to be(false)
      end

      it "returns true when the title contains the word laundry" do
        task = Task.create!(title: "do the laundry", description: "clean clothes")

        expect(task.laundry?).to be(true)
      end

      it "is not case sensitive for the word laundry" do
        task = Task.create!(title: "do the Laundry", description: "clean clothes")

        expect(task.laundry?).to be(true)
      end

      it "returns true when the description contains laundry" do
        task = Task.create!(title: "clean clothes", description: "do the laundry")

        expect(task.laundry?).to be(true)
      end

      it "returns true when the description contains laundry regardless of casing" do
        task = Task.create!(title: "clean clothes", description: "do the Laundry")

        expect(task.laundry?).to be(true)
      end

      it "returns false when the title contains nothing" do
        task = Task.create!(title: "", description: "clean clothes")

        expect(task.laundry?).to be(false)
      end

      it "returns false when the description contains nothing" do
        task = Task.create!(title: "clean clothes", description: "")

        expect(task.laundry?).to be(false)
      end

    end
  end
end