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

;%QFGRDE2^INT^1^59547,73875^0
QFGRDE2 ;
 
 
 
 
 
MEN0(MEN,UTIL) 
 S @MEN="21^2^79"
 S @MEN@(1)=$$^%QZCHW("Groupes")_"^"_"GROUPE0",@MEN@(1,"COM")=$$^%QZCHW("Acces au menu des groupes")
 S @MEN@(2)=$$^%QZCHW("Individus")_"^"_"IND0",@MEN@(2,"COM")=$$^%QZCHW("Acces au menu des individus")
 Q:(UTIL="S")!(UTIL="C")
 S @MEN@(3)=$$^%QZCHW("Inseparables")_"^"_"INSEP",@MEN@(3,"COM")=$$^%QZCHW("Modification des inseparables")
 S @MEN@(4)=$$^%QZCHW("Incompatibles")_"^"_"INCOM",@MEN@(4,"COM")=$$^%QZCHW("Modification des incompatibles")
 S @MEN@(5)=$$^%QZCHW("Maj.des.indicateurs")_"^"_"MAJ",@MEN@(5,"COM")=$$^%QZCHW("Mise a jour des concessions et de l'equilibre")
 S @MEN@(6)=$$^%QZCHW("Etude")_"^"_"ETU",@MEN@(6,"COM")=$$^%QZCHW("Acces aux attributs de l'etude")
 S @MEN@(7)=$$^%QZCHW("Histogramme")_"^"_"HISTO",@MEN@(7,"COM")=$$^%QZCHW("Representation graphique de la somme des attributs capac. pour chaque poste")
 S @MEN@(8)=$$^%QZCHW("Automatique")_"^"_"AUT",@MEN@(8,"COM")=$$^%QZCHW("Equilibr. automat. sous nouvel. contraintes.ATTENTION detruit modifs.nouvel.")
 S @MEN@(9)=$$^%QZCHW("Resultat")_"^"_"VISU",@MEN@(9,"COM")=$$^%QZCHW("Resultat du dernier equilibrage automatique")
 S @MEN@(10)=$$^%QZCHW("Traitements")_"^"_"TRT",@MEN@(10,"COM")=$$^%QZCHW("acces aux traitements")
 Q
 
MENG(MEN,UTIL) 
 N I
 S @MEN@(1)=$$^%QZCHW("Creation")_"^"_"CREGR",@MEN@(1,"COM")=$$^%QZCHW("Creer un groupe")
 S @MEN@(2)=$$^%QZCHW("Suppression")_"^"_"SUPGR",@MEN@(2,"COM")=$$^%QZCHW("Supprimer un groupe")
 S @MEN@(3)=$$^%QZCHW("Fusion")_"^"_"FUSGR",@MEN@(3,"COM")=$$^%QZCHW("Fusionner des groupes")
 S @MEN@(4)=$$^%QZCHW("Designation")_"^"_"DESIGN",@MEN@(4,"COM")=$$^%QZCHW("Modifier la designation d'un groupe")
 S @MEN@(5)=$$^%QZCHW("Zoom")_"^"_"ZOOM",@MEN@(5,"COM")=$$^%QZCHW("Visualiser tous les elements d'un groupe")
 
 
 
 
 S I=5
 I (UTIL="L")!(UTIL="C") S I=I+1,@MEN@(I)=$$^%QZCHW("Liste")_"^"_"LISGR",@MEN@(I,"COM")=$$^%QZCHW("Lister les groupes contenant un individu")
 S I=I+1,@MEN@(I)=$$^%QZCHW("Visu.pleine.page")_"^"_"VISGR",@MEN@(I,"COM")=$$^%QZCHW("Passer en mode pleine page")
 S I=I+1,@MEN@(I)=$$^%QZCHW("Individus")_"^"_"IND0",@MEN@(I,"COM")=$$^%QZCHW("Acceder au menu des individus")
 S I=I+1,@MEN@(I)=$$^%QZCHW("Tri")_"^"_"TRI",@MEN@(I,"COM")=$$^%QZCHW("ordonner les individus d'un groupe ou les groupes eux memes")
 G COM
 
MENI(MEN) 
 N I
 S @MEN@(1)=$$^%QZCHW("Affectation")_"^"_"AFFOBJ",@MEN@(1,"COM")=$$^%QZCHW("Affecter des individus choisis a un groupe")
 S @MEN@(2)=$$^%QZCHW("Rappel")_"^"_"RAPPEL",@MEN@(2,"COM")=$$^%QZCHW("Rappeler des individus d'un groupe")
 S @MEN@(3)=$$^%QZCHW("Transfert")_"^"_"REPORT",@MEN@(3,"COM")=$$^%QZCHW("Reporter des individus d'un groupe vers un autre groupe")
 S @MEN@(4)=$$^%QZCHW("Visu.pleine.page")_"^"_"VISIN",@MEN@(4,"COM")=$$^%QZCHW("Passer en mode pleine page")
 S @MEN@(5)=$$^%QZCHW("Groupes")_"^"_"GROUPE0",@MEN@(5,"COM")=$$^%QZCHW("Acceder au menu des groupes")
 S @MEN@(6)=$$^%QZCHW("Tri")_"^"_"TRII",@MEN@(6,"COM")=$$^%QZCHW("Ordonner l'ensemble des individus (manuellement ou automatiquement)")
 S I=6
 G COM
 
COM 
 S I=I+1,@MEN@(I)=$$^%QZCHW("Entree")_"^"_"ENT",@MEN@(I,"COM")=$$^%QZCHW("Entrer dans la fenetre")
 S I=I+1,@MEN@(I)="+^PLUS",@MEN@(I,"EQU")="=",@MEN@(I,"COM")=$$^%QZCHW("Avancer d'une page")
 S I=I+1,@MEN@(I)="-^MOINS",@MEN@(I,"EQU")="_",@MEN@(I,"COM")=$$^%QZCHW("Reculer d'une page")
 S I=I+1,@MEN@(I)=$$^%QZCHW("Page")_"^PAGE",@MEN@(I,"COM")=$$^%QZCHW("Changer de page")
 S I=I+1,@MEN@(I)=$$^%QZCHW("Repere")_"^REPER",@MEN@(I,"COM")=$$^%QZCHW("Afficher le repere des pages")
 S @MEN="21^10^79"
 Q

