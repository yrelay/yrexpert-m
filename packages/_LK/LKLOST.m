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

;LKLOST^INT^1^59547,74867^0
LKLOST(D,F,INDEX,LOCAL) 
 
 
 
 
 
 
 
 
 N I,ER,BLK,NUM,OKECR
 S OKECR=$$GET^%SGVAR("ECR")
 S ER=$$INIT^LKZPAR(TEMP,@PAR@("LKZPAR"))
 Q:ER ER
 S ER=$$INIT^LKEX(@PAR@("LKEX"),@PAR@("LKEX","EXTERNE"))
 Q:ER ER
 S MODE=$$^%QCAZG($$CONCAS^%QZCHAD(PAR,"MODE"))
 S BLK=D
 F I=1:1 S BLK=$O(@DATAS@(1,BLK)) Q:(BLK=F)!(BLK="")  D T(@DATAS@(1,BLK),$$NEXT(BLK),LOCAL) I OKECR,(BLK#10)=0 S (DX,DY)=10 X XY W BLK
 
 D CURON^%VVIDEO
 S ER=$$FIN^LKZPAR(TEMP)
 S ER=$$FIN^LKEX
 Q ER
 
T(X,Y,LOCAL) S ER=$$EDGE^LKZPAR(TEMP,X,Y)
 S ER=$$INC^LKZPAR(TEMP)
 S ER=$$EX^LKEX($$NIV^LKZPAR(TEMP),$$I^LKZPAR(TEMP),X,DATAD,.INDEX,MODE,LOCAL)
 Q
 
NEXT(B) N V S V=$O(@DATAS@(1,B)) Q:V="" ""
 S V=@DATAS@(1,V) Q V
 
 
 
 
 
 
 
 
 
LOLO(D,F,INDEX,LOCAL) 
 N I,ER,BLK0,BLK2,BLK3
 S ER=$$INIT^LKZPAR(TEMP,@PAR@("LKZPAR"))
 Q:ER ER
 S ER=$$INIT^LKEX(@PAR@("LKEX"),@PAR@("LKEX","EXTERNE"))
 Q:ER ER
 S MODE=$$^%QCAZG($$CONCAS^%QZCHAD(PAR,"MODE"))
 S BLK1=$O(@DATAS@(""))
 F I=0:0 Q:BLK1=""  D LOLO1 S BLK1=$O(@DATAS@(BLK1))
 D CURON^%VVIDEO
 S ER=$$FIN^LKZPAR(TEMP)
 S ER=$$FIN^LKEX
 Q ER
LOLO1 S BLK2=$O(@DATAS@(BLK1,""))
 F I=0:0 Q:BLK2=""  D LOLO2 S BLK2=$O(@DATAS@(BLK1,BLK2))
 Q
LOLO2 S BLK3=$O(@DATAS@(BLK1,BLK2,""))
 F I=1:1 Q:BLK3=""  D TT(@DATAS@(BLK1,BLK2,BLK3),$$NEXT(BLK3),LOCAL) S BLK3=$O(@DATAS@(BLK2,BLK2,BLK3))
 Q
 
TT(X,Y,LOCAL) S ER=$$EDGE^LKZPAR(TEMP,X,Y)
 S ER=$$INC^LKZPAR(TEMP)
 S ER=$$EX^LKEX($$NIV^LKZPAR(TEMP),$$I^LKZPAR(TEMP),X,DATAD,.INDEX,MODE,LOCAL)
 Q
 
NEXTT(B) N V S V=$O(@DATAS@(BLK1,BLK2,B)) Q:V="" ""
 S V=@DATAS@(1,V) Q V
 
 
 
 
 
 
 
 
 
LOST2(D,F,INDEX,LOCAL) 
 N I,ER,BLK,NUM,OKECR
 S OKECR=$$GET^%SGVAR("ECR")
 S ER=$$INIT^LKZPAR(TEMP,@PAR@("LKZPAR"))
 Q:ER ER
 S ER=$$INIT^LKEX(@PAR@("LKEX"),@PAR@("LKEX","EXTERNE"))
 Q:ER ER
 S MODE=$$^%QCAZG($$CONCAS^%QZCHAD(PAR,"MODE"))
 S BLK=D
 F I=1:1 S BLK=$O(@DATAS@(1,BLK)) Q:(BLK=F)!(BLK="")  D PARCN I OKECR,(BLK#10)=0 S (DX,DY)=10 X XY W BLK
 S ER=$$FIN^LKZPAR(TEMP)
 S ER=$$FIN^LKEX
 Q ER
 
PARCN 
 D:OKECR MSG^%VZEATT($$^%QZCHW("Enregistrements traites")_" : "_BLK)
 S NUM=""
PN S NUM=$O(@DATAS@(1,BLK,NUM)) Q:NUM=""
 D TRAIT(@DATAS@(1,BLK,NUM),"",LOCAL)
 G PN
 
TRAIT(X,Y,LOCAL) S ER=$$EDGE^LKZPAR(TEMP,X,Y)
 S ER=$$INC^LKZPAR(TEMP)
 S ER=$$EX^LKEX2($$NIV^LKZPAR(TEMP),$$I^LKZPAR(TEMP),X,DATAD,.INDEX,MODE,NUM,LOCAL)
 Q

