import type { NextApiRequest, NextApiResponse } from 'next'
import db from '../../connection'

export default async (req: NextApiRequest, res: NextApiResponse) => {
	try {
		// NOTE: 따옴표(')가 아닌 backtick(`) 사용
		const query: string = `
			select DISTINCT * from team
				left join records on (team.tid = team_id)
		`
		const [ rows, fields ] = await db.execute(query)

		res.status(200).json(rows)
	} catch (err) {
		return res.status(500).json(err)
	}
}