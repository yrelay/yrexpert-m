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

;%SDTX38^INT^1^59547,73890^0
SDTX38 ;;
 ;;^[QUI]SDSYMBC("W",8,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("X",5,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("X",5,1)=S AD=27
 ;;^[QUI]SDSYMBC("X",5,2)=S OD=26
 ;;^[QUI]SDSYMBC("X",5,3)=S AA=0
 ;;^[QUI]SDSYMBC("X",5,4)=S OA=-0
 ;;^[QUI]SDSYMBC("X",5,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("X",6,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("X",6,1)=S AD=0
 ;;^[QUI]SDSYMBC("X",6,2)=S OD=26
 ;;^[QUI]SDSYMBC("X",6,3)=S AA=27
 ;;^[QUI]SDSYMBC("X",6,4)=S OA=-0
 ;;^[QUI]SDSYMBC("X",6,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("Y",5,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("Y",5,1)=S AD=0
 ;;^[QUI]SDSYMBC("Y",5,2)=S OD=26
 ;;^[QUI]SDSYMBC("Y",5,3)=S AA=14
 ;;^[QUI]SDSYMBC("Y",5,4)=S OA=13
 ;;^[QUI]SDSYMBC("Y",5,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("Y",6,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("Y",6,1)=S AD=27
 ;;^[QUI]SDSYMBC("Y",6,2)=S OD=26
 ;;^[QUI]SDSYMBC("Y",6,3)=S AA=0
 ;;^[QUI]SDSYMBC("Y",6,4)=S OA=-0
 ;;^[QUI]SDSYMBC("Y",6,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("Z",2,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("Z",2,1)=S AD=0
 ;;^[QUI]SDSYMBC("Z",2,2)=S OD=26
 ;;^[QUI]SDSYMBC("Z",2,3)=S AA=27
 ;;^[QUI]SDSYMBC("Z",2,4)=S OA=26
 ;;^[QUI]SDSYMBC("Z",2,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("Z",4,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("Z",4,1)=S AD=27
 ;;^[QUI]SDSYMBC("Z",4,2)=S OD=-0
 ;;^[QUI]SDSYMBC("Z",4,3)=S AA=0
 ;;^[QUI]SDSYMBC("Z",4,4)=S OA=-0
 ;;^[QUI]SDSYMBC("Z",4,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("Z",5,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("Z",5,1)=S AD=27
 ;;^[QUI]SDSYMBC("Z",5,2)=S OD=26
 ;;^[QUI]SDSYMBC("Z",5,3)=S AA=0
 ;;^[QUI]SDSYMBC("Z",5,4)=S OA=-0
 ;;^[QUI]SDSYMBC("Z",5,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("a",1,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("a",1,1)=S AD=8
 ;;^[QUI]SDSYMBC("a",1,2)=S OD=13
 ;;^[QUI]SDSYMBC("a",1,3)=S AA=17
 ;;^[QUI]SDSYMBC("a",1,4)=S OA=13
 ;;^[QUI]SDSYMBC("a",1,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("a",2,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("a",2,1)=S AD=17
 ;;^[QUI]SDSYMBC("a",2,2)=S OD=13
 ;;^[QUI]SDSYMBC("a",2,3)=S AA=21
 ;;^[QUI]SDSYMBC("a",2,4)=S OA=11
 ;;^[QUI]SDSYMBC("a",2,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("a",3,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("a",3,1)=S AD=21
 ;;^[QUI]SDSYMBC("a",3,2)=S OD=11
 ;;^[QUI]SDSYMBC("a",3,3)=S AA=21
 ;;^[QUI]SDSYMBC("a",3,4)=S OA=2
 ;;^[QUI]SDSYMBC("a",3,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("a",4,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("a",4,1)=S AD=21
 ;;^[QUI]SDSYMBC("a",4,2)=S OD=2
 ;;^[QUI]SDSYMBC("a",4,3)=S AA=19
 ;;^[QUI]SDSYMBC("a",4,4)=S OA=-0
 ;;^[QUI]SDSYMBC("a",4,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("a",5,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("a",5,1)=S AD=19
 ;;^[QUI]SDSYMBC("a",5,2)=S OD=-0
 ;;^[QUI]SDSYMBC("a",5,3)=S AA=8
 ;;^[QUI]SDSYMBC("a",5,4)=S OA=-0
 ;;^[QUI]SDSYMBC("a",5,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("a",6,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("a",6,1)=S AD=8
 ;;^[QUI]SDSYMBC("a",6,2)=S OD=-0
 ;;^[QUI]SDSYMBC("a",6,3)=S AA=6
 ;;^[QUI]SDSYMBC("a",6,4)=S OA=2
 ;;^[QUI]SDSYMBC("a",6,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("a",7,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("a",7,1)=S AD=6

