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

;%JRNDIA^INT^1^59547,73870^0
%JRNDIA ;;11:58 AM  15 Sep 1992; 14 Sep 92  4:17 PM ; 15 Sep 92 12:07 PM
 
 
 N MENG,JOURN,ADRES,CONTR,GSEL,%J
 S MENG=$$TEMP^%SGUTIL,GSEL=$$TEMP^%SGUTIL
 S @MENG="21^10^79"
 S @MENG@(1)=$$^%QZCHW("visualiser")_"^ACCES",@MENG@(1,"COM")=$$^%QZCHW("visualiser le contenu d'un journal")
 S @MENG@(2)=$$^%QZCHW("supprimer")_"^SUPP",@MENG@(2,"COM")=$$^%QZCHW("supprimer des journaux")
 D CLEPAG^%VVIDEO
 D AFF
MENG S DX=0,DY=22 D CLEBAS^%VVIDEO,^%VQUIKMN(0,80,22,MENG,.ADRES,.CONTR) G:(CONTR="A")!(CONTR="F") END G:ADRES'="" @ADRES
END 
 K @(MENG),@(GSEL)
 Q
 
ACCES S JOURN=$$CHOIX1
 G:JOURN="" MENG
 D VISU^%JRNGES(JOURN,0,0,70,15)
 D CLEPAG^%VVIDEO
 G MENG
SUPP K @(GSEL)
 D CHOIXN(GSEL)
 S JOURN="" F %J=0:0 S JOURN=$O(@GSEL@(JOURN)) Q:JOURN=""  D SUPPJ^%JRNGES(JOURN)
 D CLEPAG^%VVIDEO,AFF
 G MENG
 
 
 
AFF 
 N GLOJ,GRES
 S GRES=$$TEMP^%SGUTIL
 S UCO=$$TEMP^%SGUTIL
 S @UCO@("AFF")="$$EXP2^%JRNDIA"
 D ^%QULCHP("^[QUI]JOURNYXP",GRES,UCO,"journal      creation                   commentaire                    ",5,1,12,-1)
 Q
 
CHOIX1() 
 N GLOJ,JOURN,GRES
 S GRES=$$TEMP^%SGUTIL
 S UCO=$$TEMP^%SGUTIL
 S @UCO@("AFF")="$$EXP2^%JRNDIA"
 D ^%QULCHP("^[QUI]JOURNYXP",GRES,UCO,"journal      creation                   commentaire                    ",5,1,12,1)
 Q $O(@GRES@(""))
 
CHOIXN(GRES) 
 N GLOJ,ROUTAFF,JOURN
 S UCO=$$TEMP^%SGUTIL
 S @UCO@("AFF")="$$EXP2^%JRNDIA"
 D ^%QULCHP("^[QUI]JOURNYXP",GRES,UCO,"journal      creation                   commentaire                    ",5,1,12,2)
 Q
 
EXPAND(S) 
 Q S_"  "_^[QUI]JOURNYXP(S,"DATE.CREATION")_"  "_^[QUI]JOURNYXP(S,"COMMENT")
 
EXP2(TAB) Q $$EXPAND(@TAB@("O"))

