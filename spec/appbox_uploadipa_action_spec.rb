describe Fastlane::Actions::AppboxUploadipaAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The appbox_uploadipa plugin is working!")

      Fastlane::Actions::AppboxUploadipaAction.run(nil)
    end
  end
end
