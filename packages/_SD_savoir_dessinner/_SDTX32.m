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

;%SDTX32^INT^1^59547,73890^0
SDTX32 ;;
 ;;^[QUI]SDSYMBC("J",9,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("J",10,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("J",10,1)=S AD=14
 ;;^[QUI]SDSYMBC("J",10,2)=S OD=6
 ;;^[QUI]SDSYMBC("J",10,3)=S AA=14
 ;;^[QUI]SDSYMBC("J",10,4)=S OA=4
 ;;^[QUI]SDSYMBC("J",10,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("J",11,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("J",11,1)=S AD=14
 ;;^[QUI]SDSYMBC("J",11,2)=S OD=4
 ;;^[QUI]SDSYMBC("J",11,3)=S AA=10
 ;;^[QUI]SDSYMBC("J",11,4)=S OA=-0
 ;;^[QUI]SDSYMBC("J",11,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("J",12,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("J",12,1)=S AD=10
 ;;^[QUI]SDSYMBC("J",12,2)=S OD=-0
 ;;^[QUI]SDSYMBC("J",12,3)=S AA=4
 ;;^[QUI]SDSYMBC("J",12,4)=S OA=-0
 ;;^[QUI]SDSYMBC("J",12,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("J",13,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("J",13,1)=S AD=4
 ;;^[QUI]SDSYMBC("J",13,2)=S OD=-0
 ;;^[QUI]SDSYMBC("J",13,3)=S AA=0
 ;;^[QUI]SDSYMBC("J",13,4)=S OA=4
 ;;^[QUI]SDSYMBC("J",13,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("J",14,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("J",14,1)=S AD=0
 ;;^[QUI]SDSYMBC("J",14,2)=S OD=4
 ;;^[QUI]SDSYMBC("J",14,3)=S AA=0
 ;;^[QUI]SDSYMBC("J",14,4)=S OA=6
 ;;^[QUI]SDSYMBC("J",14,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("K",1,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("K",1,1)=S AD=0
 ;;^[QUI]SDSYMBC("K",1,2)=S OD=-0
 ;;^[QUI]SDSYMBC("K",1,3)=S AA=0
 ;;^[QUI]SDSYMBC("K",1,4)=S OA=26
 ;;^[QUI]SDSYMBC("K",1,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("K",5,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("K",5,1)=S AD=0
 ;;^[QUI]SDSYMBC("K",5,2)=S OD=13
 ;;^[QUI]SDSYMBC("K",5,3)=S AA=19
 ;;^[QUI]SDSYMBC("K",5,4)=S OA=26
 ;;^[QUI]SDSYMBC("K",5,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("K",6,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("K",6,1)=S AD=6
 ;;^[QUI]SDSYMBC("K",6,2)=S OD=17
 ;;^[QUI]SDSYMBC("K",6,3)=S AA=19
 ;;^[QUI]SDSYMBC("K",6,4)=S OA=-0
 ;;^[QUI]SDSYMBC("K",6,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("L",1,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("L",1,1)=S AD=0
 ;;^[QUI]SDSYMBC("L",1,2)=S OD=-0
 ;;^[QUI]SDSYMBC("L",1,3)=S AA=0
 ;;^[QUI]SDSYMBC("L",1,4)=S OA=26
 ;;^[QUI]SDSYMBC("L",1,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("L",4,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("L",4,1)=S AD=27
 ;;^[QUI]SDSYMBC("L",4,2)=S OD=-0
 ;;^[QUI]SDSYMBC("L",4,3)=S AA=0
 ;;^[QUI]SDSYMBC("L",4,4)=S OA=-0
 ;;^[QUI]SDSYMBC("L",4,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("M",1,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("M",1,1)=S AD=0
 ;;^[QUI]SDSYMBC("M",1,2)=S OD=-0
 ;;^[QUI]SDSYMBC("M",1,3)=S AA=0
 ;;^[QUI]SDSYMBC("M",1,4)=S OA=26
 ;;^[QUI]SDSYMBC("M",1,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("M",3,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("M",3,1)=S AD=27
 ;;^[QUI]SDSYMBC("M",3,2)=S OD=26
 ;;^[QUI]SDSYMBC("M",3,3)=S AA=27
 ;;^[QUI]SDSYMBC("M",3,4)=S OA=-0
 ;;^[QUI]SDSYMBC("M",3,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("M",5,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("M",5,1)=S AD=0
 ;;^[QUI]SDSYMBC("M",5,2)=S OD=26
 ;;^[QUI]SDSYMBC("M",5,3)=S AA=14
 ;;^[QUI]SDSYMBC("M",5,4)=S OA=13
 ;;^[QUI]SDSYMBC("M",5,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("M",6,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("M",6,1)=S AD=14

