require "spec_helper"

RSpec.describe YachtSanitizer do
  good_data = [["Sun Fast 40",
    "Sun Odyssey 30",
    "Sun Odyssey 44",
    "Sun Odyssey 479",
    "Sun Odyssey 43",
    "Sun Odyssey 54",
    "Sun Odyssey 419",
    "Sun Odyssey 389"],
   ["98 000€ ttc", "24 500€ ttc", "85 400€ ttc", "269 800€ ttc", "88 000€ ttc", "150 000€ ht", "120 000€ ht", "faire une offre"],
   ["2001", "1993", "2010", "2016", "2001", "2004", "2017", "0"],
   ["11.4m", "9.2m", "13.7m", "14.3m", "12.8m", "16.5m", "12.7m", "11.7m"],
   ["3.9m", "2.9m", "4.3m", "4.4m", "4.1m", "4.9m", "3.9m", "3.7m"],
   ["Jeanneau Sun Fast 40 performance en très bon état",
    "Jeanneau Sun Odyssey 30 en bon état",
    "Jeanneau Sun Odyssey 44l en bon état",
    "Jeanneau Sun Odyssey 479 en très bon état",
    "Jeanneau Sun Odyssey 43 en bon état ",
    "Jeanneau Sun Odyssey 54 DS en bon état",
    "Jeanneau Sun Odyssey 419 en très bon état",
    "Jeanneau Sun Odyssey 389 en excellent état"]]

  dark_data = [["Sun Fast 40",
    "Sun Odyssey 30",   ["11.4m", "9.2m", "13.7m", "14.3m", "12.8m", "16.5m", "12.7m", "11.7m"],
    "Sun Odyssey 389"],
   ["98 000€ ttc", "24 500€ ttc", "85 400€ ttc", "269 800€ ttc", "88 000€ ttc", "150 000€ ht", "120 000€ ht", "faire une offre"],2,
   ["3.9m", "2.9m", "4.3m", "4.4m", "4.1m", "4.9m", "3.9m", "3.7m"],
   ["Jeanneau Sun Fast 40 performance en très bon état",
    "Jeanneau Sun Odyssey 30 en bon état",
    "Jeanneau Sun Odyssey 44l en bon état",
    "Jeanneau Sun Odyssey 479 en très bon état",
    "Jeanneau Sun Odyssey 43 en bon état ",
    "Jeanneau Sun Odyssey 54 DS en bon état",
    "Jeanneau Sun Odyssey 419 en très bon état",
    "Jeanneau Sun Odyssey 389 en excellent état"]]

  it "return true" do
    yacht_sanitizer = YachtSanitizer.new(good_data)
    expect(yacht_sanitizer.check_type_data).to eql(true)
  end

  it "return false" do
    yacht_sanitizer = YachtSanitizer.new(dark_data)
    expect(yacht_sanitizer.check_type_data).to eql(false)
  end

  it "return true" do
    yacht_sanitizer = YachtSanitizer.new(good_data)
    expect(yacht_sanitizer.check_size_data).to eql(true)
  end

  it "return false" do
    yacht_sanitizer = YachtSanitizer.new(dark_data)
    expect(yacht_sanitizer.check_size_data).to eql(false)
  end

  # it "return true" do
  #   yacht_sanitizer = YachtSanitizer.new(good_data)
  #   expect(yacht_sanitizer.transform_data).to eql(true)
  # end

  it "return false" do
    yacht_sanitizer = YachtSanitizer.new(dark_data)
    expect(yacht_sanitizer.transform_data).to eql(false)
  end
end
