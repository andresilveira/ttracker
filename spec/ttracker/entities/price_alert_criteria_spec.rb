require 'spec_helper'

describe PriceAlertCriteria do
  it 'should contain an operation' do
    criteria = PriceAlertCriteria.new(operation: '<=')
    criteria.operation.must_equal '<='
  end

  it 'should contain a threshold' do
    criteria = PriceAlertCriteria.new(threshold: 100)
    criteria.threshold.must_equal 100
  end

  describe '#achieved_threshold?' do
    describe 'when the operation is greater than or equal to' do
      describe 'and the threshold is 100' do
        let(:criteria) { criteria = PriceAlertCriteria.new(operation: '>=', threshold: 100) }
        it 'should return true for 200' do
          criteria.achieved_threshold?(200).must_equal true
        end

        it 'should return true for 100' do
          criteria.achieved_threshold?(100).must_equal true
        end

        it 'should return false for 99' do
          criteria.achieved_threshold?(99).must_equal false
        end
      end
    end

    describe 'when the operation is less than or equal to' do
      describe 'and the threshold is 100' do
        let(:criteria) { criteria = PriceAlertCriteria.new(operation: '<=', threshold: 100) }
        it 'should return true for 99' do
          criteria.achieved_threshold?(99).must_equal true
        end

        it 'should return true for 100' do
          criteria.achieved_threshold?(100).must_equal true
        end

        it 'should return false for 200' do
          criteria.achieved_threshold?(200).must_equal false
        end
      end
    end
  end
end
