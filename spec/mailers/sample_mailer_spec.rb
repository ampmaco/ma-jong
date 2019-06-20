require "rails_helper"

RSpec.describe SampleMailer, type: :mailer do
  describe "send_when_update" do
    let(:mail) { SampleMailer.send_when_update }

    it "renders the headers" do
      expect(mail.subject).to eq("Send when update")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
