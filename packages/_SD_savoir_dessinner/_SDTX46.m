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

;%SDTX46^INT^1^59547,73890^0
SDTX46 ;;
 ;;^[QUI]SDSYMBC("q",7,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("q",8,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("q",8,1)=S AD=10
 ;;^[QUI]SDSYMBC("q",8,2)=S OD=-0
 ;;^[QUI]SDSYMBC("q",8,3)=S AA=17
 ;;^[QUI]SDSYMBC("q",8,4)=S OA=-0
 ;;^[QUI]SDSYMBC("q",8,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("q",9,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("q",9,1)=S AD=17
 ;;^[QUI]SDSYMBC("q",9,2)=S OD=-0
 ;;^[QUI]SDSYMBC("q",9,3)=S AA=21
 ;;^[QUI]SDSYMBC("q",9,4)=S OA=4
 ;;^[QUI]SDSYMBC("q",9,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("q",10,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("q",10,1)=S AD=21
 ;;^[QUI]SDSYMBC("q",10,2)=S OD=13
 ;;^[QUI]SDSYMBC("q",10,3)=S AA=21
 ;;^[QUI]SDSYMBC("q",10,4)=S OA=-14
 ;;^[QUI]SDSYMBC("q",10,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("r",2,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("r",2,1)=S AD=6
 ;;^[QUI]SDSYMBC("r",2,2)=S OD=-0
 ;;^[QUI]SDSYMBC("r",2,3)=S AA=6
 ;;^[QUI]SDSYMBC("r",2,4)=S OA=13
 ;;^[QUI]SDSYMBC("r",2,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("r",3,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("r",3,1)=S AD=6
 ;;^[QUI]SDSYMBC("r",3,2)=S OD=9
 ;;^[QUI]SDSYMBC("r",3,3)=S AA=10
 ;;^[QUI]SDSYMBC("r",3,4)=S OA=13
 ;;^[QUI]SDSYMBC("r",3,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("r",4,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("r",4,1)=S AD=10
 ;;^[QUI]SDSYMBC("r",4,2)=S OD=13
 ;;^[QUI]SDSYMBC("r",4,3)=S AA=17
 ;;^[QUI]SDSYMBC("r",4,4)=S OA=13
 ;;^[QUI]SDSYMBC("r",4,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("r",5,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("r",5,1)=S AD=17
 ;;^[QUI]SDSYMBC("r",5,2)=S OD=13
 ;;^[QUI]SDSYMBC("r",5,3)=S AA=21
 ;;^[QUI]SDSYMBC("r",5,4)=S OA=9
 ;;^[QUI]SDSYMBC("r",5,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("s",1,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("s",1,1)=S AD=21
 ;;^[QUI]SDSYMBC("s",1,2)=S OD=11
 ;;^[QUI]SDSYMBC("s",1,3)=S AA=19
 ;;^[QUI]SDSYMBC("s",1,4)=S OA=13
 ;;^[QUI]SDSYMBC("s",1,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("s",2,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("s",2,1)=S AD=19
 ;;^[QUI]SDSYMBC("s",2,2)=S OD=13
 ;;^[QUI]SDSYMBC("s",2,3)=S AA=8
 ;;^[QUI]SDSYMBC("s",2,4)=S OA=13
 ;;^[QUI]SDSYMBC("s",2,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("s",3,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("s",3,1)=S AD=8
 ;;^[QUI]SDSYMBC("s",3,2)=S OD=13
 ;;^[QUI]SDSYMBC("s",3,3)=S AA=6
 ;;^[QUI]SDSYMBC("s",3,4)=S OA=11
 ;;^[QUI]SDSYMBC("s",3,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("s",4,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("s",4,1)=S AD=6
 ;;^[QUI]SDSYMBC("s",4,2)=S OD=11
 ;;^[QUI]SDSYMBC("s",4,3)=S AA=6
 ;;^[QUI]SDSYMBC("s",4,4)=S OA=9
 ;;^[QUI]SDSYMBC("s",4,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("s",5,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("s",5,1)=S AD=6
 ;;^[QUI]SDSYMBC("s",5,2)=S OD=9
 ;;^[QUI]SDSYMBC("s",5,3)=S AA=8
 ;;^[QUI]SDSYMBC("s",5,4)=S OA=8
 ;;^[QUI]SDSYMBC("s",5,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("s",6,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("s",6,1)=S AD=8
 ;;^[QUI]SDSYMBC("s",6,2)=S OD=8
 ;;^[QUI]SDSYMBC("s",6,3)=S AA=19
 ;;^[QUI]SDSYMBC("s",6,4)=S OA=8
 ;;^[QUI]SDSYMBC("s",6,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("s",7,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("s",7,1)=S AD=19

