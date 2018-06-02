require 'rails_helper'

RSpec.describe CommentPolicy do

  let(:subscriber) { create(:user, email: 'subscriber@test.com', role: :subscriber) }
  let(:journalist) { create(:user, email: 'journalist@test.com', role: :journalist) }
  let(:editor) { create(:user, email: 'editor@test.com', role: :editor) }


  let(:comment) { create(:comment) }

  context 'Subscriber can NOT approve comment' do
    subject { described_class.new(subscriber, comment) }
    it { is_expected.to forbid_edit_and_update_actions }
  end

  context 'Journalist can NOT approve comment' do
    subject { described_class.new(journalist, comment) }
    it { is_expected.to forbid_edit_and_update_actions }
  end

  context 'Editor can approve comment' do
    subject { described_class.new(editor, comment) }
    it { is_expected.to permit_edit_and_update_actions }
  end


end
