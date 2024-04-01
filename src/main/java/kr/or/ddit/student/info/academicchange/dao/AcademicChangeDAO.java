package kr.or.ddit.student.info.academicchange.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.utils.abMapper.AbstractCommonMapper;
import kr.or.ddit.vo.common.CommunityVO;
import kr.or.ddit.vo.info.AcademicClassificationVO;
import kr.or.ddit.vo.info.AcademicRecordChangeVO;

@Mapper
public interface AcademicChangeDAO extends AbstractCommonMapper<CommunityVO, String> {

	/**
	 * 학적변동신청내역조회
	 * @param memNo
	 * @return null일 가능성 有
	 */
	public List<AcademicRecordChangeVO>selectList(String memNo);
	/**
	 * 단건조회
	 * @param rnum
	 * @return null X 
	 */
	public AcademicRecordChangeVO selectRecord(String arcNo);
	/**
	 * 학적변동분류 조회(ex) 일반휴학, 군휴학, 복학)
	 * @return null X
	 */
	public List<AcademicClassificationVO> selectType();
	/**
	 * 학적변동신청
	 * @param newRecord
	 * @return 
	 */
	public int insertOne(AcademicRecordChangeVO newRecord);
	/**
	 * 학적변동신청변경
	 * @param newRecord
	 * @return
	 */
	public int updateOne(AcademicRecordChangeVO newRecord);
	/**
	 * 학적변동신청삭제
	 * @param rnum
	 * @return
	 */
	public int deleteOne(String arcNo);
}
