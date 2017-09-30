;!----------------------------------------------------------------------------!
;!                                                                            !
;! Licence et conditions d'utilisation                                        !
;! Yexpert : (your) Systeme Expert sous Mumps GT.M et GNU/Linux               !
;! Copyright (C) 2001-2015 by Hamid LOUAKED (HL).                             !
;!                                                                            !
;! Hamid LOUAKED                                                              !
;! 10, impasse Faraday                                                        !
;! 78520 LIMAY                                                                !
;! France                                                                     !
;!                                                                            !
;! yexpert@yrelay.fr                                                          !
;! http://www.yrelay.fr/                                                      !
;!                                                                            !
;! Ce programme est un logiciel libre ; vous pouvez le redistribuer           !
;! et/ou le modifier conformement aux dispositions de la Licence Publique     !
;! Generale GNU, telle que publiee par la Free Software Foundation ;          !
;! version 3 de la licence, ou encore (a votre choix) toute version ulterieure.
;!                                                                            !
;! Ce programme est distribue dans l'espoir qu'il sera utile,                 !
;! mais SANS AUCUNE GARANTIE ; sans meme la garantie implicite de             !
;! COMMERCIALISATION ou D'ADAPTATION A UN OBJET PARTICULIER.                  !
;! Pour plus de details, voir la Licence Publique Generale GNU.               !
;!                                                                            !
;! Un exemplaire de la Licence Publique Generale GNU doit etre fourni avec    !
;! ce programme ; si ce n'est pas le cas,                                     !
;! ecrivez a la Free Software Foundation Inc.,                                !
;! 675 Mass Ave, Cambridge, MA 02139, Etats-Unis.                             !
;!                                                                            !
;! Ce logiciel est telechargeable a l'adresse http://www.yrelay.fr/ ;         !
;! vous trouverez egalement, sur ce site, un mode d'emploi complet            !
;! et des informations supplementaires.                                       !
;!                                                                            !
;!----------------------------------------------------------------------------!
;!                                                                            !
;! GNU General Public License : http://www.gnu.org/copyleft/gpl.html          !
;!                                                                            !
;! Traduction francaise : http://dachary.org/loic/gpl-french.pdf              !
;!                                                                            !
;!----------------------------------------------------------------------------!

;!============================================================================!
;! Nomprog     :                                                              !
;! Module      :                                                              !
;! But         :                                                              !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;TO9EXPLA^INT^1^59547,74871^0
TO9EXPLA ;
 
 S REFP=$P(GRIL,"^",2),NUGRIL=$P(GRIL,"^",3),TYP=$P(GRIL,"^",4),DP=$P(REFP,"/",1),POSX=$P(REFP,"/",2)
 
 S QUW=$S(TYP=1:QUI,1:%UCI)
 S OBJ=$P(NUGRIL,"#",1),NORM=$P(NUGRIL,"#",2),IDENT=$P(NUGRIL,"#",3)
 S COL=$S(POSX=10:1,POSX=33:2,1:3),NBC=3 D PGE^%ABGRPAG
 S NBLG=NBLG+1,^POSENR(DOLARI,NBLG)="",NBLG=NBLG+1,^POSENR(DOLARI,NBLG)=""
 S NBLG=NBLG+1,^POSENR(DOLARI,NBLG)=$$^%QZCHW("          Valeur obtenue par l'abaque (page ")_PGE_$$^%QZCHW(",colonne ")_COL_") :"
 S NBLG=NBLG+1,^POSENR(DOLARI,NBLG)="",%CH=OBJ,%LGR=20+$L(%CH) D ^%QZCHBK S NBLG=NBLG+1,^POSENR(DOLARI,NBLG)=%CH
 S %CH=NORM,%LGR=20+$L(%CH) D ^%QZCHBK S NBLG=NBLG+1,^POSENR(DOLARI,NBLG)=%CH
 S %CH=IDENT,%LGR=20+$L(%CH) D ^%QZCHBK S NBLG=NBLG+1,^POSENR(DOLARI,NBLG)=%CH
 S NBLG=NBLG+1,^POSENR(DOLARI,NBLG)="",NBLG=NBLG+1,^POSENR(DOLARI,NBLG)=$$^%QZCHW("          car :") D PREMIS
FIN Q
PREMIS S NBLG=NBLG+1,^POSENR(DOLARI,NBLG)="",GRINU=^[QUI]REFABAC(OBJ,NORM,IDENT),PR=-1,REVA=AVER,%DL="   "
 F %ERP=1:1 S PR=$N(^[QUI]PARAGRIL(GRINU,PR)) Q:PR=-1  S AVER=PR,REULAV=$S($D(@TABTV):@TABTV,1:"") D STO
 S AVER=REVA Q
STO S %CH=%DL_PR,%LGR=12+$L(%CH) D ^%QZCHBK
 S NBLG=NBLG+1,^POSENR(DOLARI,NBLG)=%CH,RGL=$L(%CH),%CH=" = "_REULAV,%LGR=(40+$L(%CH))-RGL D ^%QZCHBK
 S ^POSENR(DOLARI,NBLG)=^POSENR(DOLARI,NBLG)_%CH,%DL=$$^%QZCHW("et ")
 Q

