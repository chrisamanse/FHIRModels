//
//  Media.swift
//  HealthSoftware
//
//  Generated from FHIR 3.0.1.11917 (http://hl7.org/fhir/StructureDefinition/Media)
//  Copyright 2020 Apple Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

import FMCore

/**
 A photo, video, or audio recording acquired or used in healthcare. The actual content may be inline or provided by
 direct reference.
 */
open class Media: DomainResource {
	
	override open class var resourceType: ResourceType { return .media }
	
	/// All possible types for "occurrence[x]"
	public enum OccurrenceX: Hashable {
		case dateTime(FHIRPrimitive<DateTime>)
		case period(Period)
	}
	
	/// Identifier(s) for the image
	public var identifier: [Identifier]?
	
	/// Procedure that caused this media to be created
	public var basedOn: [Reference]?
	
	/// Whether the media is a photo (still image), an audio recording, or a video recording.
	public var type: FHIRPrimitive<DigitalMediaType>
	
	/// The type of acquisition equipment/process
	public var subtype: CodeableConcept?
	
	/// Imaging view, e.g. Lateral or Antero-posterior
	public var view: CodeableConcept?
	
	/// Who/What this Media is a record of
	public var subject: Reference?
	
	/// Encounter / Episode associated with media
	public var context: Reference?
	
	/// When Media was collected
	/// One of `occurrence[x]`
	public var occurrence: OccurrenceX?
	
	/// The person who generated the image
	public var `operator`: Reference?
	
	/// Why was event performed?
	public var reasonCode: [CodeableConcept]?
	
	/// Body part in media
	public var bodySite: CodeableConcept?
	
	/// Observing Device
	public var device: Reference?
	
	/// Height of the image in pixels (photo/video)
	public var height: FHIRPrimitive<FHIRPositiveInteger>?
	
	/// Width of the image in pixels (photo/video)
	public var width: FHIRPrimitive<FHIRPositiveInteger>?
	
	/// Number of frames if > 1 (photo)
	public var frames: FHIRPrimitive<FHIRPositiveInteger>?
	
	/// Length in seconds (audio / video)
	public var duration: FHIRPrimitive<FHIRUnsignedInteger>?
	
	/// Actual Media - reference or data
	public var content: Attachment
	
	/// Comments made about the media
	public var note: [Annotation]?
	
	/// Designated initializer taking all required properties
	public init(content: Attachment, type: FHIRPrimitive<DigitalMediaType>) {
		self.content = content
		self.type = type
		super.init()
	}
	
	/// Convenience initializer
	public convenience init(
							basedOn: [Reference]? = nil,
							bodySite: CodeableConcept? = nil,
							contained: [ResourceProxy]? = nil,
							content: Attachment,
							context: Reference? = nil,
							device: Reference? = nil,
							duration: FHIRPrimitive<FHIRUnsignedInteger>? = nil,
							`extension`: [Extension]? = nil,
							frames: FHIRPrimitive<FHIRPositiveInteger>? = nil,
							height: FHIRPrimitive<FHIRPositiveInteger>? = nil,
							id: FHIRPrimitive<FHIRString>? = nil,
							identifier: [Identifier]? = nil,
							implicitRules: FHIRPrimitive<FHIRURI>? = nil,
							language: FHIRPrimitive<FHIRString>? = nil,
							meta: Meta? = nil,
							modifierExtension: [Extension]? = nil,
							note: [Annotation]? = nil,
							occurrence: OccurrenceX? = nil,
							`operator`: Reference? = nil,
							reasonCode: [CodeableConcept]? = nil,
							subject: Reference? = nil,
							subtype: CodeableConcept? = nil,
							text: Narrative? = nil,
							type: FHIRPrimitive<DigitalMediaType>,
							view: CodeableConcept? = nil,
							width: FHIRPrimitive<FHIRPositiveInteger>? = nil)
	{
		self.init(content: content, type: type)
		self.basedOn = basedOn
		self.bodySite = bodySite
		self.contained = contained
		self.context = context
		self.device = device
		self.duration = duration
		self.`extension` = `extension`
		self.frames = frames
		self.height = height
		self.id = id
		self.identifier = identifier
		self.implicitRules = implicitRules
		self.language = language
		self.meta = meta
		self.modifierExtension = modifierExtension
		self.note = note
		self.occurrence = occurrence
		self.`operator` = `operator`
		self.reasonCode = reasonCode
		self.subject = subject
		self.subtype = subtype
		self.text = text
		self.view = view
		self.width = width
	}
	
	// MARK: - Codable
	
	private enum CodingKeys: String, CodingKey {
		case basedOn
		case bodySite
		case content
		case context
		case device
		case duration; case _duration
		case frames; case _frames
		case height; case _height
		case identifier
		case note
		case occurrenceDateTime; case _occurrenceDateTime
		case occurrencePeriod
		case `operator` = "operator"
		case reasonCode
		case subject
		case subtype
		case type; case _type
		case view
		case width; case _width
	}
	
	/// Initializer for Decodable
	public required init(from decoder: Decoder) throws {
		let _container = try decoder.container(keyedBy: CodingKeys.self)
		
		// Decode all our properties
		self.basedOn = try [Reference](from: _container, forKeyIfPresent: .basedOn)
		self.bodySite = try CodeableConcept(from: _container, forKeyIfPresent: .bodySite)
		self.content = try Attachment(from: _container, forKey: .content)
		self.context = try Reference(from: _container, forKeyIfPresent: .context)
		self.device = try Reference(from: _container, forKeyIfPresent: .device)
		self.duration = try FHIRPrimitive<FHIRUnsignedInteger>(from: _container, forKeyIfPresent: .duration, auxiliaryKey: ._duration)
		self.frames = try FHIRPrimitive<FHIRPositiveInteger>(from: _container, forKeyIfPresent: .frames, auxiliaryKey: ._frames)
		self.height = try FHIRPrimitive<FHIRPositiveInteger>(from: _container, forKeyIfPresent: .height, auxiliaryKey: ._height)
		self.identifier = try [Identifier](from: _container, forKeyIfPresent: .identifier)
		self.note = try [Annotation](from: _container, forKeyIfPresent: .note)
		var _t_occurrence: OccurrenceX? = nil
		if let occurrenceDateTime = try FHIRPrimitive<DateTime>(from: _container, forKeyIfPresent: .occurrenceDateTime, auxiliaryKey: ._occurrenceDateTime) {
			if _t_occurrence != nil {
				throw DecodingError.dataCorruptedError(forKey: .occurrenceDateTime, in: _container, debugDescription: "More than one value provided for \"occurrence\"")
			}
			_t_occurrence = .dateTime(occurrenceDateTime)
		}
		if let occurrencePeriod = try Period(from: _container, forKeyIfPresent: .occurrencePeriod) {
			if _t_occurrence != nil {
				throw DecodingError.dataCorruptedError(forKey: .occurrencePeriod, in: _container, debugDescription: "More than one value provided for \"occurrence\"")
			}
			_t_occurrence = .period(occurrencePeriod)
		}
		self.occurrence = _t_occurrence
		self.`operator` = try Reference(from: _container, forKeyIfPresent: .`operator`)
		self.reasonCode = try [CodeableConcept](from: _container, forKeyIfPresent: .reasonCode)
		self.subject = try Reference(from: _container, forKeyIfPresent: .subject)
		self.subtype = try CodeableConcept(from: _container, forKeyIfPresent: .subtype)
		self.type = try FHIRPrimitive<DigitalMediaType>(from: _container, forKey: .type, auxiliaryKey: ._type)
		self.view = try CodeableConcept(from: _container, forKeyIfPresent: .view)
		self.width = try FHIRPrimitive<FHIRPositiveInteger>(from: _container, forKeyIfPresent: .width, auxiliaryKey: ._width)
		try super.init(from: decoder)
	}
	
	/// Encodable
	public override func encode(to encoder: Encoder) throws {
		var _container = encoder.container(keyedBy: CodingKeys.self)
		
		// Encode all our properties
		try basedOn?.encode(on: &_container, forKey: .basedOn)
		try bodySite?.encode(on: &_container, forKey: .bodySite)
		try content.encode(on: &_container, forKey: .content)
		try context?.encode(on: &_container, forKey: .context)
		try device?.encode(on: &_container, forKey: .device)
		try duration?.encode(on: &_container, forKey: .duration, auxiliaryKey: ._duration)
		try frames?.encode(on: &_container, forKey: .frames, auxiliaryKey: ._frames)
		try height?.encode(on: &_container, forKey: .height, auxiliaryKey: ._height)
		try identifier?.encode(on: &_container, forKey: .identifier)
		try note?.encode(on: &_container, forKey: .note)
		if let _enum = occurrence {
			switch _enum {
			case .dateTime(let _value):
				try _value.encode(on: &_container, forKey: .occurrenceDateTime, auxiliaryKey: ._occurrenceDateTime)
			case .period(let _value):
				try _value.encode(on: &_container, forKey: .occurrencePeriod)
			}
		}
		try `operator`?.encode(on: &_container, forKey: .`operator`)
		try reasonCode?.encode(on: &_container, forKey: .reasonCode)
		try subject?.encode(on: &_container, forKey: .subject)
		try subtype?.encode(on: &_container, forKey: .subtype)
		try type.encode(on: &_container, forKey: .type, auxiliaryKey: ._type)
		try view?.encode(on: &_container, forKey: .view)
		try width?.encode(on: &_container, forKey: .width, auxiliaryKey: ._width)
		try super.encode(to: encoder)
	}
	
	// MARK: - Equatable & Hashable
	
	public override func isEqual(to _other: Any?) -> Bool {
		guard let _other = _other as? Media else {
			return false
		}
		guard super.isEqual(to: _other) else {
			return false
		}
		return basedOn == _other.basedOn
		    && bodySite == _other.bodySite
		    && content == _other.content
		    && context == _other.context
		    && device == _other.device
		    && duration == _other.duration
		    && frames == _other.frames
		    && height == _other.height
		    && identifier == _other.identifier
		    && note == _other.note
		    && occurrence == _other.occurrence
		    && `operator` == _other.`operator`
		    && reasonCode == _other.reasonCode
		    && subject == _other.subject
		    && subtype == _other.subtype
		    && type == _other.type
		    && view == _other.view
		    && width == _other.width
	}
	
	public override func hash(into hasher: inout Hasher) {
		super.hash(into: &hasher)
		hasher.combine(basedOn)
		hasher.combine(bodySite)
		hasher.combine(content)
		hasher.combine(context)
		hasher.combine(device)
		hasher.combine(duration)
		hasher.combine(frames)
		hasher.combine(height)
		hasher.combine(identifier)
		hasher.combine(note)
		hasher.combine(occurrence)
		hasher.combine(`operator`)
		hasher.combine(reasonCode)
		hasher.combine(subject)
		hasher.combine(subtype)
		hasher.combine(type)
		hasher.combine(view)
		hasher.combine(width)
	}
}
