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

;%QSMODCP^INT^1^59547,73882^0
%QSMODCP(D,M,DD,MD,ECRASER) 
 
 
 
 
 
 
 
 
 
 
 N I,GLO,GLOB W ! S DX=$X,DY=$Y
 F I="RQSMOD","RQSMOD2","RQSMOD3","RQSMOD4","RQSMOD5","RQSMOD7","RQSMOD8","RQSMDL1","RQSMDL2","RQSMDL3","RQSMDL4" D MOD1
 Q
 ;HL2 MOD1 S GLO=$$CONCAS^%QZCHAD("^["""_DD_"""]"_I,MD)
MOD1 S GLO=$$CONCAS^%QZCHAD("^"_I,MD)
 I $D(@GLO)&(ECRASER=0) Q
 S GLOB=$$CONCAS^%QZCHAD("^["""_D_"""]"_I,M)
 I I="RQSMOD2",'($D(@GLOB)) S GLOB="^["""_D_"""]RQSDEFAU"
 K @(GLO) D ^%QCAGLC1(GLOB,GLO) W !,GLOB_$J("--->  ",20)_GLO
 Q
 
 
 
 
 
 
DIA N D,M,DD,MD,CTR,MM,I,DIR,ORDIN,LLDIR,YLEC
 S ORDIN=$$PCONF^%INCASTO("TYPHOST")
 S LLDIR=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"LLDIR")
 D LDIR^%QCSDIR(ORDIN,LLDIR)
 D CLEPAG^%VVIDEO
 S YLEC=6
 D LIRE2^%VREAD($$^%QZCHW("Quelle est la directory source ?       "),"",1,40,7,5,"","$$UCDIADIR^%QSMODCP",.CTR,.D)
 Q:(CTR'="")!(D="")
 S YLEC=8
 D LIRE2^%VREAD($$^%QZCHW("Quel schema a copier ?                 "),"",1,40,8,7,"","$$UCDIAM^%QSMODCP",.CTR,.M)
 Q:(CTR'="")!(M="")
 S YLEC=10
 D LIRE2^%VREAD($$^%QZCHW("Quelle est la directory destination ?  "),"",1,40,10,9,"","$$UCDIADIR^%QSMODCP",.CTR,.DD)
 Q:(CTR'="")!(DD="")
 S YLEC=12
 D LIRE2^%VREAD($$^%QZCHW("Quel est le nom du futur schema ?      "),"",1,40,12,11,"","$$UCDIAMD^%QSMODCP",.CTR,.MD)
 Q:(CTR'="")!(MD="")
 ;HL2 F I="RQSMOD","RQSMOD2","RQSMOD3","RQSMOD4","RQSMOD5","RQSMOD6","RQSMOD7","RQSMOD8","RQSMDL1","RQSMDL2","RQSMDL3","RQSMDL4" S GLO=$$CONCAS^%QZCHAD("^[DD]"_I,MD),MM=$D(@GLO) Q:MM'=0
 F I="RQSMOD","RQSMOD2","RQSMOD3","RQSMOD4","RQSMOD5","RQSMOD6","RQSMOD7","RQSMOD8","RQSMDL1","RQSMDL2","RQSMDL3","RQSMDL4" S GLO=$$CONCAS^%QZCHAD("^"_I,MD),MM=$D(@GLO) Q:MM'=0
 I MM'=0 W ! Q:'($$CONFIRM^%VZEOUI($$^%QZCHW("Souhaitez vous ecraser le schema ")_MD_$$^%QZCHW(" existant sur ")_DD_" ?"))
 D ^%QSMODCP(D,M,DD,MD,1)
 Q
UCDIADIR(YY1,REAF) 
 
 S REAF=0
 I YY1="?",'(DTM) S YY1=$$^%QUCHOIX(LLDIR,1,"",40,0,30,22)
 I YY1="" Q 1
 I '($$EXIST^%QCSCDIR(YY1)) D ^%VZEAVT($$^%QZCHW("Directory inconnue")) Q 0
 Q 1
UCDIAM(YY1,REAF) 
 N LLM
 S REAF=0
 I YY1="?" S YY1=$$^%QUCHOIX("^["""_D_"""]RQSMOD",1,"",40,0,30,22)
 I YY1="" Q 1
 I '($D(^[D]RQSMOD(YY1))) D ^%VZEAVT($$^%QZCHW("Schema inconnu")) Q 0
 Q 1
UCDIAMD(YY1,REAF) 
 S REAF=0
 I (M=YY1)&(D=DD) D ^%VZEAVT($$^%QZCHW("Vous ne pouvez copier un schema sur lui meme")) Q 0
 Q 1
 ;

