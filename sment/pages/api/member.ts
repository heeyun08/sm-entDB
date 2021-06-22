import type { NextApiRequest, NextApiResponse } from 'next'
import db from '../../connection'

export default async (req: NextApiRequest, res: NextApiResponse) => {
	try {
		// NOTE: 따옴표(')가 아닌 backtick(`) 사용
		const query: string = `
			select DISTINCT * from team
				left join team_has_member on (team.tid = team_id)
				left join member on (member_id = member.mid)
				left join image on (member.mid = image.member_id)
		`
		const [ rows, fields ] = await db.execute(query)

		//console.log(rows)
		res.status(200).json(rows)
	} catch (err) {
		return res.status(500).json(err)
	}
}